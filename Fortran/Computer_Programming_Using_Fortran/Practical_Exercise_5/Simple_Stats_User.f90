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
