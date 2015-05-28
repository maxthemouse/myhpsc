program omp_task
    use omp_lib
!$OMP PARALLEL
!$OMP SINGLE
        write(*,"(A)",advance="no") "A "
!$OMP TASK
        write(*,"(A)",advance="no") "car "
!$OMP END TASK
!$OMP TASK
        write(*,"(A)",advance="no") "race "
!$OMP END TASK
!$OMP END SINGLE
!$OMP END PARALLEL

end program
