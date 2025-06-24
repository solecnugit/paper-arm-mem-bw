CC = gcc
CFLAGS = -O3 -fopenmp -mtune=native -march=native -mcmodel=large -DSTREAM_ARRAY_SIZE=640000000 -DNTIMES=100

stream_copy: stream.c
	$(CC) $(CFLAGS) stream.c -o stream_copy

stream_scale: stream.c
	$(CC) $(CFLAGS) -DSCALE stream.c -o stream_scale

stream_add: stream.c
	$(CC) $(CFLAGS) -DADD stream.c -o stream_add

stream_triad: stream.c
	$(CC) $(CFLAGS) -DTRIAD stream.c -o stream_triad

clean:
	rm -f stream_*

all: stream_copy stream_scale stream_add stream_triad