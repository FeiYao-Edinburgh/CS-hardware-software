program realformatting

implicit none
real :: pi=4.0*atan(1.0,1.0)
write(unit=6,fmt="(E12.2)") pi
write(unit=6,fmt="(E12.4)") pi
write(unit=6,fmt="(E12.6)") pi
write(unit=6,fmt="(F12.2)") pi
write(unit=6,fmt="(F12.4)") pi
write(unit=6,fmt="(F12.6)") pi
write(unit=6,fmt="(G12.2)") pi
write(unit=6,fmt="(G12.4)") pi
write(unit=6,fmt="(G12.6)") pi

end program realformatting





