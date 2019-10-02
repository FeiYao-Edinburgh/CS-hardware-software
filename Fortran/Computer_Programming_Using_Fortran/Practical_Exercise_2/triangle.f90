program triangle

implicit none
integer :: a,b,c
write(*,*) "Type in three lengths: "
read (*,*),a,b,c
outa:if (2*max(a,b,c) < a+b+c .AND. min(a,b,b)>0) then
write(*,*) "can form a triangle"
inna:if (a==b .AND. a==c) then
write(*,*) "equilateral triangle"
else if (a==b .OR. a==c .OR. b==c) then
write(*,*) "isosceles triangle"
else
write(*,*) "triangle"
end if inna
else
write(*,*) "cannot form a triangle"
end if outa

end program triangle
