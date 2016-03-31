program matmul_acc
    
    implicit none
    integer,parameter :: SIZE=1000

    real :: a(SIZE,SIZE), b(SIZE,SIZE), c(SIZE,SIZE);
    real :: sum
    integer :: i,j,k
    integer :: it0,it1

    do i=1,SIZE
        do j=1,SIZE
            a(i,j) = real(i+j);
            b(i,j) = real(i-j);
            c(i,j) = 0.0;
        end do
    end do
    call tick(it0,it1) 
    !$acc kernels 
    do i=1,SIZE
        do j=1,SIZE
            sum = 0.0
            do k=1,SIZE
                sum = sum + a(i,k) * b(k,j)
            end do
            c(i,j) = sum
        end do
    end do
    !$acc end kernels
    call tock(it0,it1)    
end program matmul_acc
