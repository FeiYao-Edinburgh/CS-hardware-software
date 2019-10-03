program rooting
implicit none
integer::i
real :: a,x
do
write(*,fmt="(A)",advance="no") "Type the number that you want to find &
&its root: "
read*,a
if (a<=0) exit ! zero and negative values do not have roots.
write(*,fmt="(A)",advance="no") "Type your estimated root: "
read*,x
do i=1,6,1
x=(x+a/x)/2
end do
write(*,fmt="(A50,F5.2)") "The updated estimate for the root is: ",x
write(*,fmt="(A50,F5.2)") "The root actually is: ",sqrt(a)
end do
end program rooting
