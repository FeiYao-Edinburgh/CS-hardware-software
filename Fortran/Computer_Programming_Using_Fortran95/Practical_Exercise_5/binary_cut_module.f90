module binary_cut_module
implicit none
intrinsic::size,int
contains
integer function binary_cut(k,arr)
integer,intent(in)::k
integer,dimension(:),intent(in)::arr
integer::i,j,ihalf
i=1
j=size(arr)
do
if (i>=j) exit
ihalf=(i+j)/2!This will automatically become integers since i, j are integers.
if (k>ihalf) then
i=ihalf+1
else
j=ihalf
end if
end do
binary_cut=j
end function binary_cut
end module binary_cut_module

program binary_cut_user
use binary_cut_module
implicit none
integer::k=2
integer,dimension(4)::arr=(/1,2,3,4/)
print*,binary_cut(k,arr)
end program binary_cut_user
