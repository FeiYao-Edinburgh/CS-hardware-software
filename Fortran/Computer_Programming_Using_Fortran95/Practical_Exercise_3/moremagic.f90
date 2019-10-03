program moremagic

implicit none
integer :: t,n=1
integer, dimension(100) :: ts
do

write(*,fmt="(A)",advance="no") "Please type in a positive number: "
read*, t
if (t==0) stop
do
if (mod(t,2)==0) then
t=t/2
else
t=t*3+1
end if
ts(n)=t
if (t==1) exit
n=n+1
if (n>100) stop
end do

print*,"The sequence is: ",ts(1:n)
print*,"The largest value in the sequence is: ",maxval(ts(1:n))
print*,"The position of the largest value in the sequence is: ",maxloc(ts(1:n))

end do

end program moremagic
