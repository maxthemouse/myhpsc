CC=gcc
CFLAGS=-fopenmp

ALL= omp_loop ndot omp_ndot_reduction omp_imbalance omp_condition omp_section omp_section2 \
	 omp_task omp_task_fun omp_task2 

all: $(ALL)

omp_loop: omp_loop.o
	$(CC) $(CFLAGS) -o $@ $^

ndot: ndot.o ticktock.o
	$(CC) $(CFLAGS) -o $@ $^

omp_ndot_reduction: omp_ndot_reduction.o ticktock.o
	$(CC) $(CFLAGS) -o $@ $^

omp_imbalance: omp_imbalance.o ticktock.o
	$(CC) $(CFLAGS) -o $@ $^

omp_condition: omp_condition.o
	$(CC) $(CFLAGS) -o $@ $^

omp_section: omp_section.o
	$(CC) $(CFLAGS) -o $@ $^

omp_section2: omp_section2.o
	$(CC) $(CFLAGS) -o $@ $^

omp_task: omp_task.o
	$(CC) $(CFLAGS) -o $@ $^

omp_task_fun: omp_task_fun.o
	$(CC) $(CFLAGS) -o $@ $^

omp_task2: omp_task2.o
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $^ -o $@

.PHONY:clean

clean:
	rm -f $(ALL) *.o
