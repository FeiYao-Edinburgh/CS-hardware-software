program ludolphian

implicit none
integer :: i
integer,parameter :: k=SELECTED_REAL_KIND(p=15,r=31)
real(KIND=k) :: a,b,c,d,e,f

if (k>0) then
print*,"parameterization succeed."
a=1.0_k
b=1/sqrt(2.0_k)
c=1.0_k/4
d=1.0_k

do i=1,4,1
e=a
a=(a+b)/2
b=sqrt(b*e)
c=c-d*(a-e)**2
d=2*d
f=((a+b)**2)/(4*c)
write(*,fmt="(f31.12)") f
end do

else
print*,"parameterization failed."
end if

end program ludolphian
