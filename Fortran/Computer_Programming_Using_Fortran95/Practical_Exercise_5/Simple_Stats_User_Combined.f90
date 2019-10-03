module Simple_Stats

implicit none
intrinsic::sum,size,sqrt
integer::mean_use=0,std_dev_use=0

contains
real function mean(vec)
real,intent(in),dimension(:) :: vec
!integer,save::mean_use=0
mean_use=mean_use+1
mean=sum(vec)/size(vec)
end function mean

real function Std_Dev(vec)
real,intent(in),dimension(:) :: vec
!integer,save::std_dev_use=0
std_dev_use=std_dev_use+1
Std_Dev=sqrt(sum((vec-mean(vec))**2)/(size(vec)-1))
end function Std_Dev

end module Simple_Stats



program Simple_Stats_User

use Simple_Stats,only:fei_mean=>mean,fei_std_dev=>Std_Dev,mean_use,std_dev_use
implicit none
real,dimension(:),allocatable::p
integer::upbnd,i,k,ierr
character(len=6),dimension(2)::filenames

filenames=(/'statsa','statsb'/)
do k=1,2
print*,filenames(k)
open(unit=10,file=filenames(k))
read(unit=10,fmt="(I5)") upbnd
allocate(p(1:upbnd),stat=ierr)
if (ierr/=0) then
print*,"allocate memory for p failed."
cycle!Switch to next file
end if
do i=1,upbnd
read(unit=10,fmt="(F5.2)") p(i)
end do
close(unit=10)
print*,"Sequence p is: ",p
print*,"The mean and standard deviation of p are: ",fei_mean(p)," and ",&
fei_std_dev(p)," respectively."
print*,"The number of invokations of mean and Std_Dev are:",&
mean_use," and ",std_dev_use," respectively."
if (allocated(p)) deallocate(p,stat=ierr)
end do

end program Simple_Stats_User
