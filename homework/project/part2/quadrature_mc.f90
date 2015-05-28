
module quadrature_mc

contains

    function quad_mc(g, a, b, ndim, npoints)

    implicit none
    integer, intent(in) :: ndim, npoints
    real(kind=8), intent(in) :: a(ndim), b(ndim)
    real(kind=8), external :: g
    real(kind=8) :: rand_x(ndim*npoints), rand_y(ndim*npoints)
    real(kind=8) :: product, sum
    integer :: i, N


 
    rand_y = g(rand_x, ndim*npoints)

    product = 1.0d0
    N = ndim*npoints
    do i = 1, ndim
	product = product*(b(i) - a(i))
    enddo

    sum = 0.0d0
    do i = 1, N
	sum = sum + rand_y(i)
    enddo

    quad_mc = product*sum/N

    end function quad_mc

end module quadrature_mc
