!//
!//
!//

real*8 function ndot(N,x,y)
   integer :: N
   real*8 :: x(N),y(N),tot
   tot=0.0
!your omp directive goes here. You could use parallel do together 
   do i=1,N
      tot = tot + (x(i) * y(i))
   end do
!do not forget end 
   ndot = tot
end function

program omp_ndot_race

   integer,parameter :: N = 1e7
   real*8 :: x(N),y(N),ans,dot,ndot

   do i=1,N 
      x(i) = i-1.
      y(i) = i-1.
   end do

   ans=(N-1.)*N*(2.0*N-1.)/6.0;

   call tick(it0,rate);
   dot = ndot(N,x,y)
   call tock(it0,rate)
   write(*,"(A,ES12.4,A,ES12.4,A,I10)") "Dot product: ",dot," (vs ",ans,") for n = ",n
end program

