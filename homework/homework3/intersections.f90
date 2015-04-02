! $UWHPSC/codes/fortran/newton/test1.f90

program intersections

    use newton, only: solve
    use functions, only: g1_g2, g1_g2_prime

    implicit none
    real(kind=8) :: x, x0, fx
    real(kind=8) :: x0vals(4)
    integer :: iters, itest
	logical :: debug         ! set to .true. or .false.

    print *, "Test routine for computing zero of g1 - g2"
    debug = .false.

    ! values to test as x0:
    x0vals = (/-2.18d0, -1.6d0, -0.8d0, 1.45d0/)

    do itest=1,4
        x0 = x0vals(itest)
		print *, ' '  ! blank line
        call solve(g1_g2, g1_g2_prime, x0, x, iters, debug)

        print 11, x, iters
11      format('solver returns x = ', e22.15, ' after', i3, ' iterations')
    end do
        
end program intersections
