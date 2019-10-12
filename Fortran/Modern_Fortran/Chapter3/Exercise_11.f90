function degree_to_radian(degree) result(radian)
! Explicitly store the result in radians instead of the function name

implicit none ! Since this is an external procedure, implicit none.
real,intent(in)::degree
real::radian ! Do not need intent property here.
real,parameter::pi=3.14 ! pi constant needed for conversion.
radian=degree*pi/180
! return is not needed here since this is the last line of the procedure.

end function degree_to_radian


subroutine radian_to_degree(radian,degree)

implicit none ! Same as above.
real,intent(in)::radian
real,intent(inout)::degree
real,parameter::pi=3.14 ! pi constant needed for conversion.
degree=radian/pi*180
! Same as above return is not needed here but bear in mind that
! it is very useful when we know the result earlier!

end subroutine radian_to_degree


program Exercise_11
implicit none
real::indegrees(5) ! Use the second way of defining arrays.
integer::i
real::indegree,outradian,outdegree
real::degree_to_radian

! Explicit interface since external programs invoke.
! Interface blocks should be defined following variables definitions!
interface
function degree_to_radian(degree) result(radian)
real,intent(in)::degree
! From p.80 we know that only arguments need to be passed.
end function degree_to_radian
end interface

interface
subroutine radian_to_degree(radian,degree)
real,intent(in) :: radian
! degree is also an arugument and hence needs to be passed.
real,intent(inout)::degree
end subroutine radian_to_degree
end interface

indegrees=(/ 0.0,30.0,45.0,60.0,90.0 /) ! Array initialization using array constructors.
! We can also improve our external procedures to receive array arguments.
do i=1,5
outradian=degree_to_radian(indegrees(i))
call radian_to_degree(outradian,outdegree)
print*,indegrees(i),outdegree
end do

end program Exercise_11
