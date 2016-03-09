FC=gfortran
CFLAGS=-fopenmp

ALL= omp_loop ndot omp_ndot_reduction omp_imbalance omp_condition omp_section omp_task omp_task_fun

all: $(ALL)

omp_loop: omp_loop.o
	$(FC) $(CFLAGS) -o $@ $^

ndot: ndot.o ticktock.o
	$(FC) $(CFLAGS) -o $@ $^

omp_ndot_reduction: omp_ndot_reduction.o ticktock.o
	$(FC) $(CFLAGS) -o $@ $^

omp_imbalance: omp_imbalance.o ticktock.o
	$(FC) $(CFLAGS) -o $@ $^

omp_condition: omp_condition.o
	$(FC) $(CFLAGS) -o $@ $^

omp_section: omp_section.o
	$(FC) $(CFLAGS) -o $@ $^

omp_section2: omp_section2.o
	$(FC) $(CFLAGS) -o $@ $^

omp_task: omp_task.o
	$(FC) $(CFLAGS) -o $@ $^

omp_task_fun: omp_task_fun.o
	$(FC) $(CFLAGS) -o $@ $^

omp_task2: omp_task2.o
	$(FC) $(CFLAGS) -o $@ $^

%.o: %.f90
	$(FC) $(CFLAGS) -c $^ -o $@

.PHONY:clean

clean:
	rm -f $(ALL) *.o
