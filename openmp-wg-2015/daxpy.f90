program serial_daxpy

   integer,parameter :: N=1e7
   real*8,save  :: x(N),y(N),z(N)
   real*8 :: a = 5./3.

   call tick(it0,it1)
   call daxpy(N,a,x,y,z)
   call tock(it0,it1)

end program

subroutine daxpy(N,a,x,y,z)
   integer :: N
   real*8  :: a,x(N),y(N),z(N)

!initialization
   do i = 1,N
      x(i) = real(i)*real(i)
      y(i) = (i+1.)*(i-1.)
   end do

!computation
   do i = 1,N
      z(i) = x(i)*a+y(i)
   end do

end subroutine
