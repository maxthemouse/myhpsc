program hello

   use omp_lib
   integer :: nthreads = 0,my_thread = 0

   write(*,"(A)") "At the start of program."

!$omp parallel default(none) shared(nthreads) private(my_thread)
   my_thread = omp_get_thread_num()
   write(*,"(A,I4,A)") "Hello from thread",my_thread, "!"
   if (my_thread == 0) then
      nthreads = omp_get_num_threads()
   end if
!$omp end parallel
   write(*,"(A,I4,A)") "There were",nthreads," threads."

end program hello
