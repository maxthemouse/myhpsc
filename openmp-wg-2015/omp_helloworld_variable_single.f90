program hello

   use omp_lib
   integer :: nthreads = 0

   write(*,"(A)") "At the start of program."

!$omp parallel shared(nthreads)
   write(*,"(A,I4,A)") "Hello from thread",omp_get_thread_num(), "!"
!$omp single
   nthreads = omp_get_num_threads()
!$omp end single

!$omp end parallel
   write(*,"(A,I4,A)") "There were",nthreads," threads."

end program hello
