
program test1

    use quadrature, only: trapezoid, error_table, linspace

    implicit none
    real(kind=8) :: a,b,int_true
    integer :: nvals(12), i
    real(kind=8), dimension(10) :: x

    a = 0.d0
    b = 2.d0
    int_true = (b-a) + (b**4 - a**4) / 4.d0

    call linspace(x, 0.d0, 2.d0, 10)
    print *, 'linspace test'
    do i = 1, 10
	print 20, i, x(i)
20	format('i:', i3, '  x:', es13.3)
    end do
    print 10, int_true
 10 format("true integral: ", es22.14)
    print *, " "  ! blank line

    ! values of n to test:
    do i=1,12
        nvals(i) = 5 * 2**(i-1)
        enddo

    call error_table(f, a, b, nvals, int_true)

contains

    real(kind=8) function f(x)
        implicit none
        real(kind=8), intent(in) :: x 
	real(kind=8) :: k = 1.0d3
        
        f = 1.d0 + x**3 + sin(k*x)
    end function f

end program test1
