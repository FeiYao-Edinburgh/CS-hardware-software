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
