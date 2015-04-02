! $UWHPSC/codes/fortran/newton/functions.f90

module functions

    implicit none
    real(kind=8), parameter :: pi = 3.141592653589793d0

contains

real(kind=8) function f_sqrt(x)
    implicit none
    real(kind=8), intent(in) :: x

    f_sqrt = x**2 - 4.d0

end function f_sqrt


real(kind=8) function fprime_sqrt(x)
    implicit none
    real(kind=8), intent(in) :: x
    
    fprime_sqrt = 2.d0 * x

end function fprime_sqrt

real(kind=8) function g1_g2(x)
    implicit none
    real(kind=8), intent(in) :: x

    g1_g2 = x*cos(pi*x) - 1 + 0.6d0 * x**2

end function g1_g2

real(kind=8) function g1_g2_prime(x)
    implicit none
    real(kind=8), intent(in) :: x

    g1_g2_prime = 1.2d0 * x + cos(pi * x) - pi * x * sin(pi * x)

end function g1_g2_prime

end module functions
