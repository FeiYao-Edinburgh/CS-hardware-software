program simplesubroutine

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
call mysum(a,b)
write(*,*) a-b," + ",b," = ",a
end if
end do

contains
subroutine mysum(x,y)
real, intent(inout) :: x
real, intent(in) :: y
x=x+y
end subroutine mysum


end program simplesubroutine

