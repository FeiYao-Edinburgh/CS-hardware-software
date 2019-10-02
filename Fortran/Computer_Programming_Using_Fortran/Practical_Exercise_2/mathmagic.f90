program mathmagic

implicit none
integer :: t
do

write(*,fmt="(A)",advance="no") "Please type in a number: "
read*, t
if (t==0) exit

do
if (mod(t,2)==0) then
t=t/2
else
t=t*3+1
end if
write(*,*) t
if (t==1) exit
end do

end do

end program mathmagic
