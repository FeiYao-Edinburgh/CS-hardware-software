program Exercise_9

implicit none
integer,parameter::N=813,N_rep=30
integer::statCode,i,j,k,l
real,dimension(:,:,:),allocatable::a,b
real::timeStart,timeEnd
allocate(a(N,N,N),b(N,N,N),stat=statCode)
if (statCode /= 0) then
    print*,"Allocation failed."
    stop
end if
call random_number(a)
call random_number(b)

! The last indice changes fastest.
call cpu_time(time=timeStart)
do l=1,N_rep
do i=1,N
do j=1,N
do k=1,N
a(i,j,k)=a(i,j,k)+b(i,j,k)
end do
end do
end do
end do
! Print some computation results to decive the compiler.
print*,a(1,1,1)
call cpu_time(time=timeEnd)
print*,"Time for expensive loop with the last indice changes fastest = ", &
timeEnd-timeStart,"seconds"

call random_number(a)
call random_number(b)

! The first indice changes fastest.
call cpu_time(time=timeStart)
do l=1,N_rep
do k=1,N
do j=1,N
do i=1,N
a(i,j,k)=a(i,j,k)+b(i,j,k)
end do
end do
end do
end do
! Print some computation results to decive the compiler.
print*,a(1,1,1)
call cpu_time(time=timeEnd)
print*,"Time for expensive loop with the first indice changes fastest = ", &
timeEnd-timeStart,"seconds"

if (allocated(a)) deallocate(a,stat=statCode)
if (allocated(b)) deallocate(b,stat=statCode)


end program Exercise_9
