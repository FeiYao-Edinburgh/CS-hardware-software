program array_constructor

implicit none
integer :: x,i
integer, dimension(40) :: p
p=(/(41+x+x*x,x=0,39)/)
do i=1,8
print*,p((i-1)*5+1:i*5)
end do

end program array_constructor
