program fibonacci

implicit none
integer :: n
integer, dimension(0:24) :: u
u(0)=0
u(1)=1
do n=2,24
u(n)=u(n-2)+u(n-1)
end do

print*,"The sequence of this fibonacci is: ",u
print*,"The sum of the first 22 numbers is: ",sum(u(0:22)),u(24)-1
print*,"The sum of the first 24 numbers with odd indices is: ",sum(u(1:24:2)),&
u(24)
print*,"The sum of the first 22 numbers with even indices is: ",sum(u(0:22:2)),&
u(23)-1

end program fibonacci
