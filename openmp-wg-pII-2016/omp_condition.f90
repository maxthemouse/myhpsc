program omp_condition

    use omp_lib

    character(10) :: input
    integer :: i,input_val
! read the command line argument
    call getarg(1,input)
!convert to integer
    read(input,*) input_val
!$OMP PARALLEL DO if(input_val>10)
    do i=1,input_val
        write(*,"(A,I4,A,I4)") "Thread ",omp_get_thread_num()," gets i = ",i
    enddo
!$OMP END PARALLEL DO

end program
