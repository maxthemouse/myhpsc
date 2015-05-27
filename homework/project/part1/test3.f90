
program test3

    use mpi

    use quadrature, only: trapezoid
    use functions, only: f, fevals_proc, k

    implicit none
    real(kind=8) :: a,b,int_true, int_approx, dx_sub, int_sub
    real(kind=8), dimension(2) :: ab_sub

    integer :: proc_num, num_procs, ierr, n, fevals_total, nsub, j, numsent, jj, sender
    integer, dimension(MPI_STATUS_SIZE) :: status

    call MPI_INIT(ierr)
    call MPI_COMM_SIZE(MPI_COMM_WORLD, num_procs, ierr)
    call MPI_COMM_RANK(MPI_COMM_WORLD, proc_num, ierr)

    ! quit if only one process
    if (num_procs == 1) then
	print *, "*** Error: need to use at least two processes"
	go to 100
    endif

    ! All processes set these values so we don't have to broadcast:
    k = 1.d3   ! functions module variable 
    a = 0.d0
    b = 2.d0
    int_true = (b-a) + (b**4 - a**4) / 4.d0 - (1.d0/k) * (cos(k*b) - cos(k*a))
    n = 1000
    

    ! Each process keeps track of number of fevals:
    fevals_proc = 0

    if (proc_num==0) then

        print *, "How may subintervals? "
	read *, nsub

	print '("Using ",i3," processes and ",i3," subintervals.")', num_procs, nsub
        print '("true integral: ", es22.14)', int_true
        print *, " "  ! blank line
        endif

    call MPI_BCAST(nsub, 1, MPI_INTEGER, 0, MPI_COMM_WORLD, ierr)
    call MPI_BARRIER(MPI_COMM_WORLD,ierr) ! wait for process 0 to print

    ! -----------------------------------------
    ! code for Master (Processor 0):
    ! -----------------------------------------
    if (proc_num==0) then 

	numsent = 0 ! keep track of how many columns sent
        dx_sub = (b-a)/nsub
	do j=1,min(num_procs-1, nsub)
	    ab_sub(1) = a + (j-1)*dx_sub
	    !print '("sending ",i3," a = ",es22.14)', j, ab_sub(1)
	    ab_sub(2) = a + j*dx_sub
	    !print '("sending ",i3," b = ",es22.14)', j, ab_sub(2)
	    call MPI_SEND(ab_sub, 2, MPI_DOUBLE_PRECISION, j, j, &
		          MPI_COMM_WORLD, ierr)
	    numsent = numsent + 1
	enddo

	! as results come back, send out more work...
	int_approx = 0.0d0
	do j=1,nsub
	    call MPI_RECV(int_sub, 1, MPI_DOUBLE_PRECISION, &
                          MPI_ANY_SOURCE, MPI_ANY_TAG, &
		          MPI_COMM_WORLD, status, ierr)
	    sender = status(MPI_SOURCE)
	    !print '("recieving ",i3," int_sub = ",es22.14)', j, int_sub
	    int_approx = int_approx + int_sub
	
	if (numsent<nsub) then
	    ! still more work to do
	    jj = numsent + 1 
	    ab_sub(1) = a + (jj-1)*dx_sub
	    !print '("sending ",i3," a = ",es22.14)', jj, ab_sub(1)
	    ab_sub(2) = a + jj*dx_sub
	    !print '("sending ",i3," b = ",es22.14)', jj, ab_sub(2)
	    call MPI_SEND(ab_sub, 2, MPI_DOUBLE_PRECISION, sender, jj, &
		          MPI_COMM_WORLD, ierr)
	    numsent = numsent + 1
	else
	    call MPI_SEND(MPI_BOTTOM, 0, MPI_DOUBLE_PRECISION, &
			  sender, 0, MPI_COMM_WORLD, ierr)
	endif
	enddo

    endif
    ! -----------------------------------------
    ! code for Workers (Processors 1, 2, ...):
    ! -----------------------------------------
    if (proc_num /= 0) then

	!print '("process ",i3," compares to nsub ", i3)', proc_num, nsub
	if (proc_num > nsub) go to 99   ! no work expected

	do while (.true.)
	    ! repeat until message with tag== 0 received...
        call MPI_RECV(ab_sub, 2, MPI_DOUBLE_PRECISION, &
                          0, MPI_ANY_TAG, &
		          MPI_COMM_WORLD, status, ierr) 
        j = status(MPI_TAG)
	if (j==0) go to 99    ! received "done" message
	!print '("recieving ",i3," a = ",es22.14)', j, ab_sub(1)
        !print '("receiving ",i3," b = ",es22.14)', j, ab_sub(2)
        int_sub = trapezoid(f,ab_sub(1),ab_sub(2),n)
        print '("Process ",i3," with n = ",i8," computes int_approx = ",es22.14)', &
                proc_num,n, int_sub
        !print '("sending ",i3," int_sub = ",es22.14)', j, int_sub
        call MPI_SEND(int_sub, 1, MPI_DOUBLE_PRECISION, 0, j, &
		      MPI_COMM_WORLD, ierr)
	enddo

    endif

99  continue   ! might jump to here if finished early
    !print *, 'I am done!', proc_num

    call MPI_BARRIER(MPI_COMM_WORLD,ierr) ! wait for all process to print

    ! print the number of function evaluations by each thread:
    print '("fevals by Process ",i2,": ",i13)',  proc_num, fevals_proc


    call MPI_BARRIER(MPI_COMM_WORLD,ierr) ! wait for all process to print

    call MPI_REDUCE(fevals_proc,fevals_total,1,MPI_DOUBLE_PRECISION,MPI_SUM,0, &
                        MPI_COMM_WORLD,ierr)

    if (proc_num==0) then
        print '("Trapezoidal approximation with ",i8," total point: ", es22.14)', &
                nsub*n, int_approx
        print '("Total number of fevals: ",i10)', fevals_total
        endif

100 continue
    call MPI_FINALIZE(ierr)

end program test3
