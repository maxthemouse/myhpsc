program hello

   use omp_lib
   write(*,"(A)") "At the start of program."

!$omp parallel

   write(*,"(A,I3,A)") "Hello from thread ", &
    omp_get_thread_num(), "!"

!$omp end parallel

end program hello
