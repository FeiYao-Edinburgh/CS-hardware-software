program coins

implicit none
integer :: price,c50,c20,c10,c5,c2,c1

do
c50=0
c20=0
c10=0
c5=0
c2=0
c1=0

write(*,fmt="(A)",advance="no") "Please type in the price between 0 &
&100 (N.B. type 0 to end): "
read*,price

if (price==0) exit

if (price>=50) then
do
price=price-50
c50=c50+1
if (price<50) exit
end do
end if

if (price>=20) then
do
price=price-20
c20=c20+1
if (price<20) exit
end do
end if

if (price>=10) then
do
price=price-10
c10=c10+1
if (price<10) exit
end do
end if

if (price>=5) then
do
price=price-5
c5=c5+1
if (price<5) exit
end do
end if

if (price>=2) then
do
price=price-2
c2=c2+1
if (price<2) exit
end do
end if

if (price>=1) then
do
price=price-1
c1=c1+1
if (price<1) exit
end do
end if

write(*,fmt="(A4,I1,/,A4,I1,/,A4,I1,/,A3,I1,/,A3,I1,/,A3,I1)") "50: ",c50,"20: ",c20,"10: ",c10,"5: ",c5,"2: ",c2,"1: ",c1

end do

end program coins
