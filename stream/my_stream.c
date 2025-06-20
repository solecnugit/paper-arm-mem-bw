#include <float.h>
#include <limits.h>
#include <math.h>
#include <stdio.h>
#include <sys/time.h>
#include <unistd.h>

#ifndef STREAM_ARRAY_SIZE
#define STREAM_ARRAY_SIZE 41943040
#endif

#ifdef NTIMES
#if NTIMES <= 1
#define NTIMES 10
#endif
#endif
#ifndef NTIMES
#define NTIMES 100
#endif

#ifndef OFFSET
#define OFFSET 0
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

static double avgtime[4] = {0}, maxtime[4] = {0},
              mintime[4] = {FLT_MAX, FLT_MAX, FLT_MAX, FLT_MAX};

static char *label[4] = {
    "Copy:      ", "Scale:     ", "Add:       ", "Triad:     "};

static double bytes[4] = {2 * sizeof(STREAM_TYPE) * STREAM_ARRAY_SIZE,
                          2 * sizeof(STREAM_TYPE) * STREAM_ARRAY_SIZE,
                          3 * sizeof(STREAM_TYPE) * STREAM_ARRAY_SIZE,
                          3 * sizeof(STREAM_TYPE) * STREAM_ARRAY_SIZE};

extern double mysecond();
extern void checkSTREAMresults();

#ifdef _OPENMP
extern int omp_get_num_threads();
#endif
int main() {
  int quantum, checktick();
  int BytesPerWord;
  int k;
  ssize_t j;
  STREAM_TYPE scalar;
  double t, times[4][NTIMES];

  /* --- SETUP --- determine precision and check timing --- */

  printf(HLINE);
  printf("STREAM version $Revision: 5.10 $\n");
  printf(HLINE);
  BytesPerWord = sizeof(STREAM_TYPE);
  printf("This system uses %d bytes per array element.\n", BytesPerWord);

  printf(HLINE);

  printf("Array size = %llu (elements), Offset = %d (elements)\n",
         (unsigned long long)STREAM_ARRAY_SIZE, OFFSET);
  printf("Memory per array = %.1f MiB (= %.1f GiB).\n",
         BytesPerWord * ((double)STREAM_ARRAY_SIZE / 1024.0 / 1024.0),
         BytesPerWord * ((double)STREAM_ARRAY_SIZE / 1024.0 / 1024.0 / 1024.0));
  printf("Total memory required = %.1f MiB (= %.1f GiB).\n",
         (3.0 * BytesPerWord) * ((double)STREAM_ARRAY_SIZE / 1024.0 / 1024.),
         (3.0 * BytesPerWord) *
             ((double)STREAM_ARRAY_SIZE / 1024.0 / 1024. / 1024.));
  printf("Each kernel will be executed %d times.\n", NTIMES);

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

  /*	--- MAIN LOOP --- repeat test cases NTIMES times --- */

  scalar = 3.0;
  double total_time = mysecond();

  for (k = 0; k < NTIMES; k++) {
    times[0][k] = mysecond();

#pragma omp parallel for
    for (j = 0; j < STREAM_ARRAY_SIZE; j++)
      c[j] = a[j];

    times[0][k] = mysecond() - times[0][k];

    times[1][k] = mysecond();

#pragma omp parallel for
    for (j = 0; j < STREAM_ARRAY_SIZE; j++)
      b[j] = scalar * c[j];

    times[1][k] = mysecond() - times[1][k];

    times[2][k] = mysecond();

#pragma omp parallel for
    for (j = 0; j < STREAM_ARRAY_SIZE; j++)
      c[j] = a[j] + b[j];

    times[2][k] = mysecond() - times[2][k];

    times[3][k] = mysecond();

#pragma omp parallel for
    for (j = 0; j < STREAM_ARRAY_SIZE; j++)
      a[j] = b[j] + scalar * c[j];

    times[3][k] = mysecond() - times[3][k];
  }
  total_time = mysecond() - total_time;

  /*	--- SUMMARY --- */

  for (k = 1; k < NTIMES; k++) /* note -- skip first iteration */
  {
    for (j = 0; j < 4; j++) {
      avgtime[j] = avgtime[j] + times[j][k];
      mintime[j] = MIN(mintime[j], times[j][k]);
      maxtime[j] = MAX(maxtime[j], times[j][k]);
    }
  }

  printf("Function    Best Rate MB/s  Avg time     Min time     Max time\n");
  for (j = 0; j < 4; j++) {
    avgtime[j] = avgtime[j] / (double)(NTIMES - 1);

    printf("%s%12.1f  %11.6f  %11.6f  %11.6f\n", label[j],
           1.0E-06 * bytes[j] / mintime[j], avgtime[j], mintime[j], maxtime[j]);
  }
  printf(HLINE);

  printf("Total Time:           %11.6f\n", total_time);

  printf(HLINE);

  /* --- Check Results --- */
  checkSTREAMresults();
  printf(HLINE);

  return 0;
}

/* A gettimeofday routine to give access to the wall
   clock timer on most UNIX-like systems.  */

#include <time.h>

double mysecond() {
  struct timespec t;
  clock_gettime(CLOCK_MONOTONIC, &t);
  return ((double)t.tv_sec + (double)t.tv_nsec * 1.e-9);
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
    cj = aj;
    bj = scalar * cj;
    cj = aj + bj;
    aj = bj + scalar * cj;
  }

  /* accumulate deltas between observed and expected results */
  aSumErr = 0.0;
  bSumErr = 0.0;
  cSumErr = 0.0;
  for (j = 0; j < STREAM_ARRAY_SIZE; j++) {
    aSumErr += abs(a[j] - aj);
    bSumErr += abs(b[j] - bj);
    cSumErr += abs(c[j] - cj);
    // if (j == 417) printf("Index 417: c[j]: %f, cj: %f\n",c[j],cj);	//
    // MCCALPIN
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
    printf("     Expected Value: %e, AvgAbsErr: %e, AvgRelAbsErr: %e\n", aj,
           aAvgErr, abs(aAvgErr) / aj);
    ierr = 0;
    for (j = 0; j < STREAM_ARRAY_SIZE; j++) {
      if (abs(a[j] / aj - 1.0) > epsilon) {
        ierr++;
#ifdef VERBOSE
        if (ierr < 10) {
          printf("         array a: index: %ld, expected: %e, observed: %e, "
                 "relative error: %e\n",
                 j, aj, a[j], abs((aj - a[j]) / aAvgErr));
        }
#endif
      }
    }
    printf("     For array a[], %d errors were found.\n", ierr);
  }
  if (abs(bAvgErr / bj) > epsilon) {
    err++;
    printf("Failed Validation on array b[], AvgRelAbsErr > epsilon (%e)\n",
           epsilon);
    printf("     Expected Value: %e, AvgAbsErr: %e, AvgRelAbsErr: %e\n", bj,
           bAvgErr, abs(bAvgErr) / bj);
    printf("     AvgRelAbsErr > Epsilon (%e)\n", epsilon);
    ierr = 0;
    for (j = 0; j < STREAM_ARRAY_SIZE; j++) {
      if (abs(b[j] / bj - 1.0) > epsilon) {
        ierr++;
#ifdef VERBOSE
        if (ierr < 10) {
          printf("         array b: index: %ld, expected: %e, observed: %e, "
                 "relative error: %e\n",
                 j, bj, b[j], abs((bj - b[j]) / bAvgErr));
        }
#endif
      }
    }
    printf("     For array b[], %d errors were found.\n", ierr);
  }
  if (abs(cAvgErr / cj) > epsilon) {
    err++;
    printf("Failed Validation on array c[], AvgRelAbsErr > epsilon (%e)\n",
           epsilon);
    printf("     Expected Value: %e, AvgAbsErr: %e, AvgRelAbsErr: %e\n", cj,
           cAvgErr, abs(cAvgErr) / cj);
    printf("     AvgRelAbsErr > Epsilon (%e)\n", epsilon);
    ierr = 0;
    for (j = 0; j < STREAM_ARRAY_SIZE; j++) {
      if (abs(c[j] / cj - 1.0) > epsilon) {
        ierr++;
#ifdef VERBOSE
        if (ierr < 10) {
          printf("         array c: index: %ld, expected: %e, observed: %e, "
                 "relative error: %e\n",
                 j, cj, c[j], abs((cj - c[j]) / cAvgErr));
        }
#endif
      }
    }
    printf("     For array c[], %d errors were found.\n", ierr);
  }
  if (err == 0) {
    printf("Solution Validates: avg error less than %e on all three arrays\n",
           epsilon);
  }
#ifdef VERBOSE
  printf("Results Validation Verbose Results: \n");
  printf("    Expected a(1), b(1), c(1): %f %f %f \n", aj, bj, cj);
  printf("    Observed a(1), b(1), c(1): %f %f %f \n", a[1], b[1], c[1]);
  printf("    Rel Errors on a, b, c:     %e %e %e \n", abs(aAvgErr / aj),
         abs(bAvgErr / bj), abs(cAvgErr / cj));
#endif
}
