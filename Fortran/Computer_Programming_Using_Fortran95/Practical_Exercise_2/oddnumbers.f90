program oddnumbers

implicit none
integer :: n,i,t,s=0

write(*,*) "how many odd numbers would you like to type in?"
read(*,*) n
do i=1,n,1
write(*,*) "Type in an odd number: "
read(*,*) t
s=s+t
write(*,*) i,s
end do

end program oddnumbers

