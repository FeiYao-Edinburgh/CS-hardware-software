program Exercise_2

implicit none
real, parameter :: sigma = 5.67e-8
real :: alpha_present = 0.3, S0 = 1367
real :: Te

Te=sqrt(sqrt(S0*(1-alpha_present))/(4*sigma))
print*, "Te = ",Te,"K"

S0=S0*(1-0.3) ! I suppose that S0 is 30% lower means this.
Te=sqrt(sqrt(S0*(1-alpha_present))/(4*sigma))
print*, "If S0 is 30% lower, Te = ",Te,"K"

S0=1367
alpha_present=alpha_present*(1+0.3)
Te=sqrt(sqrt(S0*(1-alpha_present))/(4*sigma))
print*,"If increasing alpha_present by 30%, Te = ",Te,"K"

end program Exercise_2
