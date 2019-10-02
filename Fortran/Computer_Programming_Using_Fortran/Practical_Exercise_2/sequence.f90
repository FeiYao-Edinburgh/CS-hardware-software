program sequence

implicit none
integer :: i,j
character(len=9) :: left='1',right='1'
character(len=1) :: stri

do i=1,5,1
write(*,*) trim(left)//"x"//trim(right)//" = ",((10**i-1)/9)**2
left=trim(left) // "1"
right=trim(right) //"1"
end do

left='0'
do i=1,9,1
write(*,fmt='(A8,A7,I1)') trim(left),' x 9 + ',i
write(stri,'(I1)') i
if (left=='0') then
left=stri
else
left=trim(left) // stri
end if
end do

left='1'
do i=1,9,1
write(*,fmt="(A9,A7,I1)") trim(left),' x 8 + ',i
write(stri,fmt='(I1)') i+1
left=trim(left)//stri
end do

end program sequence
