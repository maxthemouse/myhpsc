# $UWHPSC/codes/fortran/newton/Makefile

COMMON = functions.o newton.o
OBJECTS = $(COMMON) test1.o
OBJECTS2 = $(COMMON) intersections.o
MODULES = functions.mod newton.mod

FFLAGS = -g

.PHONY: test1 clean 

test1: test1.exe
	./test1.exe

test1.exe: $(MODULES) $(OBJECTS)
	gfortran $(FFLAGS) $(OBJECTS) -o test1.exe

intersections: intersections.exe
	./intersections.exe

intersections.exe: $(MODULES) $(OBJECTS2)
	gfortran $(FFLAGS) $(OBJECTS2) -o intersections.exe

%.o : %.f90
	gfortran $(FFLAGS) -c  $< 

%.mod: %.f90
	gfortran $(FFLAGS) -c $<

clean:
	rm -f *.o *.exe *.mod

