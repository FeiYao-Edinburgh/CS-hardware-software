program skeleton

implicit none
integer :: typein

do
write(*,*) "Type in an inetger: "
read(*,*) typein
if (typein .NE. 0) then
call countInvocs()
else
write(*,*) "input as 0 and thus exit"
exit
end if
end do

contains
subroutine countInvocs()
integer::mycounts=0 ! same as integer,save::mycounts=0
mycounts=mycounts+1
write(*,*) "The subroutine countInvocs has been called ",mycounts," times"
end subroutine countInvocs

end program skeleton
