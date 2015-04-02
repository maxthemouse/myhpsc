! $UWHPSC/codes/fortran/newton/test1.f90

program test_quartic

    use newton, only: solve, tol
    use functions, only: f_quartic, fprime_quartic, epsilon

    implicit none
    real(kind=8) :: x, x0, fx, xstar
    real(kind=8) :: tolvals(3), epsvals(3)
    integer :: iters, ieps, itol
	logical :: debug         ! set to .true. or .false.

    print 10, x0
10  format('Starting with initial guess ', e22.15)
    debug = .false.

    ! values to test:
    tolvals = (/1.d-5, 1.d-10, 1.d-14 /)
    epsvals = (/1.d-4, 1.d-8, 1d-12 /)
    x0 = 4.d0

    print *, '   epsilon      tol       iters          x                f(x)       x-xstar'
    do ieps=1,3
        epsilon = epsvals(ieps)
        do itol=1,3
            tol = tolvals(itol)
            call solve(f_quartic, fprime_quartic, x0, x, iters, debug)
	    fx = f_quartic(x)
            xstar = 1 + epsilon**0.25
            print 11, epsilon, tol, iters, x, fx, abs(x - xstar)
11          format(2es13.3, i4, es24.15, 2es13.3)
        end do
    print *, ' '  ! blank line
        
    enddo

end program test_quartic
