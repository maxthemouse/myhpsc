

module quadrature

	implicit none

contains

real(kind=8) function trapazoid(f,a,b,n)
	implicit none
	real(kind=8), intent(in) :: a, b, h
	real(kind=8), external :: f
	integer, intent(in) :: n

	h = (b-a)/(n-1)
	xj = linspace(a,b,n)
	fj = f(xj)
	trapezoid = h*sum(fj) - 0.5*h*(fj[0] + fj[-1])



end function trapazoid

subroutine error_table(f,a,b,nvals,int_true)
	implicit none
	real(kind=8), intent(in) :: a, b, int_true
	real(kind=8), external :: f
	integer, intent(in) :: n
	integer, dimension(:), intent(in) :: nvals

end subroutine error_table