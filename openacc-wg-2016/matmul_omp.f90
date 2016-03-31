program matmul_acc
    
    implicit none
    integer,parameter :: SIZE=2250

    integer :: a(SIZE,SIZE), b(SIZE,SIZE), c(SIZE,SIZE);
    integer :: sum
    integer :: i,j,k
    integer :: it0,it1

    do i=1,SIZE
        do j=1,SIZE
            a(i,j) = mod(i,50);
            b(i,j) = mod(j,30);
            c(i,j) = 0;
        end do
    end do
    write(*,"(A,1I14)") "b(523,789) = ",b(523,789)
    call tick(it0,it1) 
    do i=1,SIZE
        !$omp parallel do private(k,sum)
        do j=1,SIZE
            sum = 0
            do k=1,SIZE
                sum = sum + a(i,k) * b(k,j)
            end do
            c(i,j) = sum
        end do
        !$omp end parallel do
    end do
    call tock(it0,it1)    
    write(*,"(A,1I14)") "c(523,789) = ",c(523,789)
end program matmul_acc
