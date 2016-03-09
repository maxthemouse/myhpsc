program omp_task
    use omp_lib
! PARALLEL
! SINGLE
        write(*,"(A)",advance="no") "A "
        write(*,"(A)",advance="no") "car "
        write(*,"(A)",advance="no") "race "
! end SINGLE
! end PARALLEL

end program
