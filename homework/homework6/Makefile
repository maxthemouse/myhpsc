
OBJECTS = functions.o quadrature.o
FFLAGS = 
NUM_PROCS ?= 4   # default if not specified on command line or env variable

.PHONY: test clean test2

test: test.exe
	mpiexec -n $(NUM_PROCS) test.exe

test.exe: $(OBJECTS) test.o
	mpif90 $(FFLAGS) $(OBJECTS) test.o -o test.exe

copyvalue: copyvalue.exe
	mpiexec -n $(NUM_PROCS) copyvalue.exe

copyvalue.exe: copyvalue.f90
	mpif90 $(FFLAGS) copyvalue.f90 -o copyvalue.exe

test2: test2.exe
	mpiexec -n $(NUM_PROCS) test2.exe

test2.exe: $(OBJECTS) test2.o
	mpif90 $(FFLAGS) $(OBJECTS) test2.o -o test2.exe

%.o : %.f90
	mpif90 $(FFLAGS) -c  $< 

clean:
	rm -f *.o *.exe *.mod

