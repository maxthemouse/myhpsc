program omp_loop

   use omp_lib
   integer :: my_thread
!insert omp parallel here. make my_thread a private variable
   my_thread = omp_get_thread_num()
!insert omp for the following loop
   do i=0,15
      print *,"Thread ",my_thread," gets i = ",i
   end do
!close the omp section

!close the outer omp section

end program omp_loop
