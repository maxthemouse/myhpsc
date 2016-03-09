program omp_task
    use omp_lib
!$OMP PARALLEL
!$OMP SINGLE
        write(*,"(A,I4,A)") "Thread ",omp_get_thread_num()," is creating tasks"
!$OMP TASK
        write(*,"(A,I4)") "Hello 1 from thread",omp_get_thread_num()
!$OMP END TASK
!$OMP TASK
        write(*,"(A,I4)") "Hello 2 from thread",omp_get_thread_num()
!$OMP END TASK
!$OMP END SINGLE
!$OMP END PARALLEL

end program
