program omp_loop1

   use omp_lib
   integer :: my_thread
!$omp parallel default(none) private(my_thread)
   my_thread = omp_get_thread_num()
!$omp do
   do i=0,15
      print *,"Thread ",my_thread," gets i = ",i
   end do
!$omp end do nowait

!$omp end parallel

end program omp_loop1
