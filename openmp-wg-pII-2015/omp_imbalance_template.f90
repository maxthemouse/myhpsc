
function runloop(i)
    integer :: i, my_sum,j
    my_sum = 0
    do j=1,i
        my_sum = my_sum + XOR(i,j)
    enddo
    runloop = my_sum

end function

program omp_imbalance
    integer,parameter :: N = 6e4
    integer :: i
    integer :: arr(N)
    call tick(it0,it1)
!insert omp prallel for the following loop
    do i=1,N
      arr(i)=runloop(i)
    enddo
!end of omp parallel
    call tock(it0,it1);

end program

