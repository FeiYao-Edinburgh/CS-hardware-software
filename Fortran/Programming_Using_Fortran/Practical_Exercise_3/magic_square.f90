program magic_square

implicit none
integer::i
integer, dimension(3,3) :: a,b,c
a=reshape((/4,3,8,9,5,1,2,7,6/),(/3,3/))
b=reshape((/9,4,5,2,6,10,7,8,3/),(/3,3/))
print*,"The magic square a is: "
print*,a(1,:)
print*,a(2,:)
print*,a(3,:)
print*,"The magic square b is: "
print*,b(1,:)
print*,b(2,:)
print*,b(3,:)
c=a+b
print*,"Is matrix c magic square?"
print*,(sum(c(1,:))==sum(c(:,3)) .and. sum(c(:,3))==sum((/(c(i,i),i=1,3)/)))
print*,"The magic square c is: "
print*,c(1,:)
print*,c(2,:)
print*,c(3,:)

end program magic_square
