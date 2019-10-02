program parity

implicit none

integer :: num
do

write(*,*) "Type in a number: "
read(*,*) num
if (num==0) then
EXIT
else if (mod(num,2)==0) then
write(*,*) num," is an even number"
else
write(*,*) num," is an odd number"
end if

end do

end program parity

