program pointoncircle

implicit none
intrinsic::sin,cos
real :: length,angle,radian,x,y
real,parameter :: pi=3.1415926
do
write(*,*) "Type in length and angle: "
read(*,*) length,angle
if (length .LE. 0) then
write(*,*) "length must be greater than 0"
exit
else
radian=angle/180*pi
x=length*cos(radian)
y=length*sin(radian)
write(*,*) "x = ",x,"y = ",y
end if
end do

end program pointoncircle
