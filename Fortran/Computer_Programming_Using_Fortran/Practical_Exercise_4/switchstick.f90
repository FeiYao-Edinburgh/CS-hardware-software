program switchstick

implicit none
real :: a,b
real :: smallnumber=0.00000001
do
write(*,*) "Type in two numbers: "
read(*,*) a,b
if ((abs(a-0) .LE. smallnumber) .AND. (abs(b-0) .LE. smallnumber)) then
write(*,*) "0+0=0, exit"
exit
else
call myswitch(a,b)
write(*,*) "The smaller one is: ",a,"The other one is: ",b
end if
end do

contains
subroutine myswitch(x,y)
real, intent(inout) :: x,y
real :: t
if (x .GT. y) then
t=x
x=y
y=t
end if
end subroutine myswitch


end program switchstick

