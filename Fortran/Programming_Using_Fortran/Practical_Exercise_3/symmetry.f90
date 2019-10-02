program symmetry

implicit none
integer,dimension(3,3)::a,b,c
a=reshape((/4,3,8,9,5,1,2,7,6/),(/3,3/))
print*,"The square's magic number is: ",sum(a(1,:)),(3*3*3+3)/2
b=transpose(a)
c=a+b
print*,"The symmetry matrix is:"
print*,c(1,:)
print*,c(2,:)
print*,c(3,:)

end program symmetry
