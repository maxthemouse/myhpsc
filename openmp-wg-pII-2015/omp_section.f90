program omp_section
    use omp_lib

!$OMP PARALLEL SECTIONS
!$OMP SECTION
    write(*,"(A,I4)") "Hello 1 from thread ",omp_get_thread_num()

!$OMP SECTION
    write(*,"(A,I4)") "Hello 2 from thread ",omp_get_thread_num()

!$OMP END PARALLEL SECTIONS

end program
