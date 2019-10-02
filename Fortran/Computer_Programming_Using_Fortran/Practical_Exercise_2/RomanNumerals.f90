program RomanNumerals

implicit none
integer :: x,x100,x10,x1
character(len=12)::result=""

do
write(*,fmt="(A)",advance="no") "Type in a number that will be &
&converted to Roman numerals: "
read*,x

x100=x/100
x10=(x-x100*100)/10
x1=mod(x-x100*100,10)
write(*,*) x100,x10,x1

select case (x)
case (0:999)

select case (x100)
case (0)
result=""
case (1)
result="c"
case (2)
result="cc"
case (3)
result="ccc"
case (4)
result="cd"
case (5)
result="d"
case (6)
result="dc"
case (7)
result="dcc"
case (8)
result="dccc"
case (9)
result="cm"
end select

select case (x10)
case (0)
result=trim(result)//""
case (1)
result=trim(result) // "x"
case (2)
result=trim(result) // "xx"
case (3)
result=trim(result) // "xxx"
case (4)
result=trim(result) // "xl"
case (5)
result=trim(result) // "l"
case (6)
result=trim(result) // "lx"
case (7)
result=trim(result) // "lxx"
case (8)
result=trim(result) // "lxxx"
case (9)
result=trim(result) // "xc"
end select


select case (x1)
case (0)
result=trim(result)//""
case (1)
result=trim(result) // "i"
case (2)
result=trim(result) // "ii"
case (3)
result=trim(result) // "iii"
case (4)
result=trim(result) // "iv"
case (5)
result=trim(result) // "v"
case (6)
result=trim(result) // "vi"
case (7)
result=trim(result) // "vii"
case (8)
result=trim(result) // "viii"
case (9)
result=trim(result) // "ix"
end select

write(*,fmt="(A50,I3,A4,A12)") "Corresponding Roman Numeral of ",x," is ",result

case default
exit

end select

end do

end program RomanNumerals
