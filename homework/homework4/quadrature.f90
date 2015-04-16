

module quadrature

	implicit none
	logical, parameter :: debug = .false.
	save

contains

real(kind=8) function trapezoid(f,a,b,n)
	implicit none
	real(kind=8), intent(in) :: a, b
	real(kind=8), external :: f
	real(kind=8) h
	integer, intent(in) :: n
	real(kind=8), dimension(:), allocatable :: xj, fj
	integer :: i

	allocate(xj(n))
	allocate(fj(n))
	h = (b-a)/(n-1)
	call linspace(xj,a,b,n)
	do i=1,n
		fj(i) = f(xj(i))
	end do
	if (debug) then
		do i=1,n
			print *, xj(i), fj(i)
		end do
	end if
	if (debug) then
		print 12, size(fj), sum(fj), h, fj(1), fj(n)
12		format(':num:', i3, ':sum:', es13.3, ':h:', es13.3, ':s:', es13.3, ':e:', es13.3)
	endif
	trapezoid = h*sum(fj) - 0.5*h*(fj(1) + fj(n))
	deallocate(xj)
	deallocate(fj)

end function trapezoid

subroutine error_table(f,a,b,nvals,int_true)
	implicit none
	real(kind=8), intent(in) :: a, b, int_true
	real(kind=8), external :: f
	integer, dimension(:), intent(in) :: nvals
	integer :: i
	real(kind=8) :: error, last_error, int_trap, ratio

	print *, "      n         trapezoid            error       ratio"
	last_error = 0.d0
	do i = 1, size(nvals)
		int_trap = trapezoid(f,a,b,nvals(i))
		error = abs(int_trap - int_true)
		ratio = last_error / error
		last_error = error
		print 11, nvals(i), int_trap, error, ratio
11		format(i8, es22.14, es13.3, es13.3)
	end do

end subroutine error_table

subroutine linspace(x, start, end, len)
	implicit none
	real(kind=8), dimension(:), intent(out) :: x
	real(kind=8) :: start, end, dx
	integer len, i

	dx = (end - start) / (len - 1)
	x(1:len) = [(start + ((i-1)*dx), i=1,len)]

end subroutine linspace

end module quadrature
