program VowelConsonant

implicit none
character :: x
do
write(*,fmt="(A)",advance="no") "Type in a character (terminated by @): "
read*,x
select case (x)
case ("A":"Z","a":"z")
select case (x)
case ("a","e","i","o","u","A","E","I","O","U")
write(*,*) x//" is a vowel."
case default
write(*,*) x//" is a consonant."
end select
case ("@")
exit
case default
write(*,*) x//" is neither vowel nor consonant"
end select
end do

end program VowelConsonant
