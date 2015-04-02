# $UWHPSC/codes/fortran/newton/Makefile

COMMON = functions.o newton.o
OBJECTS = $(COMMON) test1.o
OBJECTS2 = $(COMMON) test_quartic.o
MODULES = functions.mod newton.mod

FFLAGS = -g

.PHONY: test1 clean 

test1: test1.exe
	./test1.exe

test1.exe: $(MODULES) $(OBJECTS)
	gfortran $(FFLAGS) $(OBJECTS) -o test1.exe

test_quartic: test_quartic.exe
	./test_quartic.exe

test_quartic.exe: $(MODULES) $(OBJECTS2)
	gfortran $(FFLAGS) $(OBJECTS2) -o test_quartic.exe

%.o : %.f90
	gfortran $(FFLAGS) -c  $< 

%.mod: %.f90
	gfortran $(FFLAGS) -c $<

clean:
	rm -f *.o *.exe *.mod

