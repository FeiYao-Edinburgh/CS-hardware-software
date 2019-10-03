program chess

implicit none
integer :: i
integer, dimension(8,8) :: board

board(1:8:2,1:8:2)=0
board(1:8:2,2:8:2)=1
board(2:8:2,1:8:2)=1
board(2:8:2,2:8:2)=0

do i=1,8,1
write(*,*) board(:,i)
end do



end program chess

