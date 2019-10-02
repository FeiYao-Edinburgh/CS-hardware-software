program q4

implicit none
real :: radius, area, volume
real, parameter :: pi=3.1415926
write(unit=6,fmt="(A)",advance='no') "Type in the radius: "
read*,radius
area=pi*radius**2
volume=4*pi*radius**3/3

write(unit=6,fmt="(A26,F5.1,A4,F6.1)") &
"Area of cicle with radius ",&
radius, " is ",area

write(unit=6,fmt="(A28,F5.1,A4,F6.1)") &
"Volume of cicle with radius ",&
radius, " is ",volume

end program q4
