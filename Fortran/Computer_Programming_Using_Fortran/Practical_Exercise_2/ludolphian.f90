program ludolphian

implicit none
integer :: i
real:: a=1.0,b=1/sqrt(2.0),c=1.0/4,d=1.0,e,f

do i=1,4,1
e=a
a=(a+b)/2
b=sqrt(b*e)
c=c-d*(a-e)**2
d=2*d
f=((a+b)**2)/(4*c)
write(*,*) f
end do

end program ludolphian
