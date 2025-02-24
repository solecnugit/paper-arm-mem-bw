#include <float.h>
#include <limits.h>
#include <math.h>

#include <sys/time.h>

#include <dirent.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <linux/perf_event.h> /* Definition of PERF_* constants and struct perf_event_attr */
#include <sys/ioctl.h>   /* ioctl function */
#include <sys/syscall.h> /* Definition of SYS_* constants */
#include <sys/types.h>
#include <unistd.h> /* syscall function */

#include <inttypes.h>

#define MAX_DEVICES 100
#define MAX_PATH_LENGTH 256

#ifndef STREAM_ARRAY_SIZE
#define STREAM_ARRAY_SIZE 10000000
#endif

#ifdef NTIMES
#if NTIMES <= 1
#define NTIMES 10
#endif
#endif
#ifndef NTIMES
#define NTIMES 10
#endif

#ifndef OFFSET
#define OFFSET 0
#endif

#define COPY
#if defined(SCALE) || defined(ADD) || defined(TRIAD)
#undef COPY
#endif

#define HLINE "-------------------------------------------------------------\n"

#ifndef MIN
#define MIN(x, y) ((x) < (y) ? (x) : (y))
#endif
#ifndef MAX
#define MAX(x, y) ((x) > (y) ? (x) : (y))
#endif

#ifndef STREAM_TYPE
#define STREAM_TYPE double
#endif

static STREAM_TYPE a[STREAM_ARRAY_SIZE + OFFSET], b[STREAM_ARRAY_SIZE + OFFSET],
    c[STREAM_ARRAY_SIZE + OFFSET];

#ifdef COPY
static char *label = "Copy";
#elif SCALE
static char *label = "Scale";
#elif ADD
static char *label = "Add";
#elif TRIAD
static char *label = "Triad";
#endif

#if defined(COPY) || defined(SCALE)
static double bytes = 2 * sizeof(STREAM_TYPE) * STREAM_ARRAY_SIZE;
// for add and triad
#elif defined(ADD) || defined(TRIAD)
static double bytes = 3.0 * sizeof(STREAM_TYPE) * STREAM_ARRAY_SIZE;
#endif

int checktick();
double mysecond();
void checkSTREAMresults();

// latency
void print_latency();

#ifdef _OPENMP
extern int omp_get_num_threads();
#endif

double start_time, end_time;

// Executes perf_event_open syscall and makes sure it is successful or exit
static long perf_event_open(struct perf_event_attr *hw_event, pid_t pid,
                            int cpu, int group_fd, unsigned long flags) {
    int fd;
    fd = syscall(SYS_perf_event_open, hw_event, pid, cpu, group_fd, flags);
    if (fd == -1) {
        perror("Error creating event");
        exit(EXIT_FAILURE);
    }
    printf("Success creating event\n");
    return fd;
}

// Helper function to setup a perf event structure perf_event_attr
void configure_dmc620_event(struct perf_event_attr *pe, uint32_t type,
                            uint event, uint clkdiv2, uint mask, uint match) {
    memset(pe, 0, sizeof(struct perf_event_attr));

    pe->type = type;
    pe->size = sizeof(struct perf_event_attr);

    pe->config = mask;   // mask -> config:0-44
    pe->config1 = match; // match -> config1:0-44
    pe->config2 =
        (clkdiv2 << 9) |
        (event << 3); // clkdiv2 -> config2:9, event -> config2:3-8, incr
                      // -> config2:1-2, invert -> config2:0
    pe->disabled = 1;
    pe->inherit = 1;
}

int main(int argc, char *argv[]) {
    int quantum, checktick();
    int BytesPerWord;
    int k;
    ssize_t j;
    STREAM_TYPE scalar;
    double t;

    // perf event
    char *devices[MAX_DEVICES];
    int types[MAX_DEVICES];
    int device_count = 0;

    const char *base_dir = "/sys/bus/event_source/devices/";
    DIR *dir = opendir(base_dir);
    if (!dir) {
        perror("opendir");
        return EXIT_FAILURE;
    }

    struct dirent *entry;
    while ((entry = readdir(dir)) != NULL) {
        if (strncmp(entry->d_name, "arm_dmc620", strlen("arm_dmc620")) == 0) {
            devices[device_count] = strdup(entry->d_name);
            if (!devices[device_count]) {
                perror("strdup");
                closedir(dir);
                return EXIT_FAILURE;
            }
            device_count++;
            if (device_count >= MAX_DEVICES) {
                fprintf(stderr, "Too many devices found\n");
                break;
            }
        }
    }
    closedir(dir);

    for (int i = 0; i < device_count; i++) {
        char type_path[MAX_PATH_LENGTH];
        snprintf(type_path, sizeof(type_path), "%s%s/type", base_dir,
                 devices[i]);

        FILE *type_file = fopen(type_path, "r");
        if (!type_file) {
            perror("fopen");
            return EXIT_FAILURE;
        }

        char type_str[32];
        if (fgets(type_str, sizeof(type_str), type_file) == NULL) {
            perror("fgets");
            fclose(type_file);
            return EXIT_FAILURE;
        }
        fclose(type_file);

        types[i] = atoi(type_str);
    }

    struct perf_event_attr *pe =
        malloc(2 * device_count * sizeof(struct perf_event_attr));
    if (!pe) {
        perror("malloc");
        return EXIT_FAILURE;
    }
    long *fd = malloc(2 * device_count * sizeof(long));
    uint64_t *pe_val = malloc(2 * device_count * sizeof(uint64_t));

    // Configure the group of PMUs to count
    for (int i = 0; i < device_count; i++) {
        configure_dmc620_event(&pe[2 * i], types[i], 0x12, 0x1, 0x1, 0x0);
        configure_dmc620_event(&pe[2 * i + 1], types[i], 0x12, 0x1, 0x1, 0x1);
        fd[2 * i] = perf_event_open(&pe[2 * i], -1, 0, -1, 0);
        fd[2 * i + 1] = perf_event_open(&pe[2 * i + 1], -1, 0, -1, 0);
        // pid=-1 and cpu=0 -> system-wide -C 0
    }

    // Reset counters
    for (int i = 0; i < 2 * device_count; i++)
        ioctl(fd[i], PERF_EVENT_IOC_RESET, 0);

    /* --- SETUP --- determine precision and check timing --- */

    printf(HLINE);
    printf("STREAM version $Revision: 5.10 $\n");
    printf(HLINE);
    BytesPerWord = sizeof(STREAM_TYPE);
    printf("This system uses %d bytes per array element.\n", BytesPerWord);

    printf(HLINE);
#ifdef N
    printf("*****  WARNING: ******\n");
    printf("      It appears that you set the preprocessor variable N when "
           "compiling this code.\n");
    printf("      This version of the code uses the preprocesor variable "
           "STREAM_ARRAY_SIZE to control the array size\n");
    printf("      Reverting to default value of STREAM_ARRAY_SIZE=%llu\n",
           (unsigned long long)STREAM_ARRAY_SIZE);
    printf("*****  WARNING: ******\n");
#endif

    printf("Array size = %llu (elements), Offset = %d (elements)\n",
           (unsigned long long)STREAM_ARRAY_SIZE, OFFSET);
    printf("Memory per array = %.1f MiB (= %.1f GiB).\n",
           BytesPerWord * ((double)STREAM_ARRAY_SIZE / 1024.0 / 1024.0),
           BytesPerWord *
               ((double)STREAM_ARRAY_SIZE / 1024.0 / 1024.0 / 1024.0));
    printf("Total memory required = %.1f MiB (= %.1f GiB).\n",
           (3.0 * BytesPerWord) * ((double)STREAM_ARRAY_SIZE / 1024.0 / 1024.),
           (3.0 * BytesPerWord) *
               ((double)STREAM_ARRAY_SIZE / 1024.0 / 1024. / 1024.));
    printf("Each kernel will be executed %d times.\n", NTIMES);
    printf(
        " The *best* time for each kernel (excluding the first iteration)\n");
    printf(" will be used to compute the reported bandwidth.\n");

#ifdef _OPENMP
    printf(HLINE);
#pragma omp parallel
    {
#pragma omp master
        {
            k = omp_get_num_threads();
            printf("Number of Threads requested = %i\n", k);
        }
    }
#endif

#ifdef _OPENMP
    k = 0;
#pragma omp parallel
#pragma omp atomic
    k++;
    printf("Number of Threads counted = %i\n", k);
#endif

    /* Get initial value for system clock. */
#pragma omp parallel for
    for (j = 0; j < STREAM_ARRAY_SIZE; j++) {
        a[j] = 1.0;
        b[j] = 2.0;
        c[j] = 0.0;
    }

    printf(HLINE);

    if ((quantum = checktick()) >= 1)
        printf("Your clock granularity/precision appears to be "
               "%d microseconds.\n",
               quantum);
    else {
        printf("Your clock granularity appears to be "
               "less than one microsecond.\n");
        quantum = 1;
    }

    t = mysecond();
#pragma omp parallel for
    for (j = 0; j < STREAM_ARRAY_SIZE; j++)
        a[j] = 2.0E0 * a[j];
    t = 1.0E6 * (mysecond() - t);

    printf("Each test below will take on the order"
           " of %d microseconds.\n",
           (int)t);
    printf("   (= %d clock ticks)\n", (int)(t / quantum));
    printf("Increase the size of the arrays if this shows that\n");
    printf("you are not getting at least 20 clock ticks per test.\n");

    printf(HLINE);

    printf("WARNING -- The above is only a rough guideline.\n");
    printf("For best results, please be sure you know the\n");
    printf("precision of your system timer.\n");
    printf(HLINE);

    /*	--- MAIN LOOP --- repeat test cases NTIMES times --- */

    scalar = 3.0;
    for (k = 0; k < NTIMES; k++) {
        if (k == 1) {
            start_time = mysecond();
            // Start counting
            for (int i = 0; i < 2 * device_count; i++)
                ioctl(fd[i], PERF_EVENT_IOC_ENABLE, 0);
        }
#ifdef COPY
#pragma omp parallel for
        for (j = 0; j < STREAM_ARRAY_SIZE; j++)
            c[j] = a[j];
#endif

#ifdef SCALE
#pragma omp parallel for
        for (j = 0; j < STREAM_ARRAY_SIZE; j++)
            b[j] = scalar * c[j];
#endif

#ifdef ADD
#pragma omp parallel for
        for (j = 0; j < STREAM_ARRAY_SIZE; j++)
            c[j] = a[j] + b[j];
#endif

#ifdef TRIAD
#pragma omp parallel for
        for (j = 0; j < STREAM_ARRAY_SIZE; j++)
            a[j] = b[j] + scalar * c[j];
#endif
    }
    end_time = mysecond();
    // Stop all counters
    for (int i = 0; i < 2 * device_count; i++)
        ioctl(fd[i], PERF_EVENT_IOC_DISABLE, 0);

    /*	--- SUMMARY --- */
    double total_data = (NTIMES - 1) * bytes;
    double total_time = end_time - start_time;
    double avg_bw_mb = 1.0E-06 * total_data / total_time;

    printf("Function\tAvg Bandwidth\n");
    printf("%s:\t%12.2f\n", label, avg_bw_mb);
    printf(HLINE);

    // Read and print result
    uint64_t total_hw_data = 0;
    for (int i = 0; i < device_count; i++) {
        read(fd[2 * i], &pe_val[2 * i], sizeof(uint64_t));
        total_hw_data += pe_val[2 * i];
        read(fd[2 * i + 1], &pe_val[2 * i + 1], sizeof(uint64_t));
        total_hw_data += pe_val[2 * i + 1];
        printf("Device: %s, Type: %d, Read Count: %" PRIu64
               ", Write Count: %" PRIu64 "\n",
               devices[i], types[i], pe_val[2 * i], pe_val[2 * i + 1]);
    }
    printf("Hardware bandwidth: %12.2f MB/s \n",
           1.0E-06 * (double)total_hw_data * 64 / total_time);

    // Close counter file descriptors
    for (int i = 0; i < device_count; i++) {
        close(fd[2 * i]);
        close(fd[2 * i + 1]);
    }

    for (int i = 0; i < device_count; i++) {
        free(devices[i]);
    }

    free(pe);
    free(fd);
    free(pe_val);

    /* --- Check Results --- */
    checkSTREAMresults();

    return 0;
}

#define M 20

int checktick() {
    int i, minDelta, Delta;
    double t1, t2, timesfound[M];

    /*  Collect a sequence of M unique time values from the system. */

    for (i = 0; i < M; i++) {
        t1 = mysecond();
        while (((t2 = mysecond()) - t1) < 1.0E-6)
            ;
        timesfound[i] = t1 = t2;
    }

    /*
     * Determine the minimum difference between these M values.
     * This result will be our estimate (in microseconds) for the
     * clock granularity.
     */

    minDelta = 1000000;
    for (i = 1; i < M; i++) {
        Delta = (int)(1.0E6 * (timesfound[i] - timesfound[i - 1]));
        minDelta = MIN(minDelta, MAX(Delta, 0));
    }
    return (minDelta);
}

/* A gettimeofday routine to give access to the wall
   clock timer on most UNIX-like systems.  */

#include <sys/time.h>

double mysecond() {
    struct timeval tp;
    gettimeofday(&tp, (struct timezone *)0);
    return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
}

#ifndef abs
#define abs(a) ((a) >= 0 ? (a) : -(a))
#endif

void checkSTREAMresults() {
    STREAM_TYPE aj, bj, cj, scalar;
    STREAM_TYPE aSumErr, bSumErr, cSumErr;
    STREAM_TYPE aAvgErr, bAvgErr, cAvgErr;
    double epsilon;
    ssize_t j;
    int k, ierr, err;

    /* reproduce initialization */
    aj = 1.0;
    bj = 2.0;
    cj = 0.0;
    /* a[] is modified during timing check */
    aj = 2.0E0 * aj;
    /* now execute timing loop */
    scalar = 3.0;

    for (k = 0; k < NTIMES; k++) {
#ifdef COPY
        cj = aj;
#elif SCALAR
        bj = scalar * cj;
#elif ADD
        cj = aj + bj;
#elif TRIAD
        aj = bj + scalar * cj;
#endif
    }

    /* accumulate deltas between observed and expected results */
    aSumErr = 0.0;
    bSumErr = 0.0;
    cSumErr = 0.0;
    for (j = 0; j < STREAM_ARRAY_SIZE; j++) {
        aSumErr += abs(a[j] - aj);
        bSumErr += abs(b[j] - bj);
        cSumErr += abs(c[j] - cj);
        // if (j == 417) printf("Index 417: c[j]: %f, cj: %f\n",c[j],cj);
        // // MCCALPIN
    }
    aAvgErr = aSumErr / (STREAM_TYPE)STREAM_ARRAY_SIZE;
    bAvgErr = bSumErr / (STREAM_TYPE)STREAM_ARRAY_SIZE;
    cAvgErr = cSumErr / (STREAM_TYPE)STREAM_ARRAY_SIZE;

    if (sizeof(STREAM_TYPE) == 4) {
        epsilon = 1.e-6;
    } else if (sizeof(STREAM_TYPE) == 8) {
        epsilon = 1.e-13;
    } else {
        printf("WEIRD: sizeof(STREAM_TYPE) = %lu\n", sizeof(STREAM_TYPE));
        epsilon = 1.e-6;
    }

    err = 0;
    if (abs(aAvgErr / aj) > epsilon) {
        err++;
        printf("Failed Validation on array a[], AvgRelAbsErr > epsilon (%e)\n",
               epsilon);
        printf("\tExpected Value: %e, AvgAbsErr: %e, AvgRelAbsErr: %e\n", aj,
               aAvgErr, abs(aAvgErr) / aj);
        ierr = 0;
        for (j = 0; j < STREAM_ARRAY_SIZE; j++) {
            if (abs(a[j] / aj - 1.0) > epsilon) {
                ierr++;
#ifdef VERBOSE
                if (ierr < 10) {
                    printf("         array a: index: %ld, expected: %e, "
                           "observed: %e, "
                           "relative error: %e\n",
                           j, aj, a[j], abs((aj - a[j]) / aAvgErr));
                }
#endif
            }
        }
        printf("\tFor array a[], %d errors were found.\n", ierr);
    }
    if (abs(bAvgErr / bj) > epsilon) {
        err++;
        printf("Failed Validation on array b[], AvgRelAbsErr > epsilon (%e)\n",
               epsilon);
        printf("\tExpected Value: %e, AvgAbsErr: %e, AvgRelAbsErr: %e\n", bj,
               bAvgErr, abs(bAvgErr) / bj);
        printf("\tAvgRelAbsErr > Epsilon (%e)\n", epsilon);
        ierr = 0;
        for (j = 0; j < STREAM_ARRAY_SIZE; j++) {
            if (abs(b[j] / bj - 1.0) > epsilon) {
                ierr++;
#ifdef VERBOSE
                if (ierr < 10) {
                    printf("         array b: index: %ld, expected: %e, "
                           "observed: %e, "
                           "relative error: %e\n",
                           j, bj, b[j], abs((bj - b[j]) / bAvgErr));
                }
#endif
            }
        }
        printf("\tFor array b[], %d errors were found.\n", ierr);
    }
    if (abs(cAvgErr / cj) > epsilon) {
        err++;
        printf("Failed Validation on array c[], AvgRelAbsErr > epsilon (%e)\n",
               epsilon);
        printf("\tExpected Value: %e, AvgAbsErr: %e, AvgRelAbsErr: %e\n", cj,
               cAvgErr, abs(cAvgErr) / cj);
        printf("\tAvgRelAbsErr > Epsilon (%e)\n", epsilon);
        ierr = 0;
        for (j = 0; j < STREAM_ARRAY_SIZE; j++) {
            if (abs(c[j] / cj - 1.0) > epsilon) {
                ierr++;
#ifdef VERBOSE
                if (ierr < 10) {
                    printf("         array c: index: %ld, expected: %e, "
                           "observed: %e, "
                           "relative error: %e\n",
                           j, cj, c[j], abs((cj - c[j]) / cAvgErr));
                }
#endif
            }
        }
        printf("\tFor array c[], %d errors were found.\n", ierr);
    }
    if (err == 0)
        printf("Solution Validates:\tavg error less than %e on all arrays\n",
               epsilon);
#ifdef VERBOSE
    printf("Results Validation Verbose Results: \n");
    printf("    Expected a(1), b(1), c(1): %f %f %f \n", aj, bj, cj);
    printf("    Observed a(1), b(1), c(1): %f %f %f \n", a[1], b[1], c[1]);
    printf("    Rel Errors on a, b, c:     %e %e %e \n", abs(aAvgErr / aj),
           abs(bAvgErr / bj), abs(cAvgErr / cj));
#endif
}