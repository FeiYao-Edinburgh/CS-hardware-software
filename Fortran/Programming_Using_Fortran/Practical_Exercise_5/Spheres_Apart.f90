module Spheres_Apart_Module

implicit none
intrinsic::sqrt

type coords_3d
real::x,y,z
end type coords_3d

type sphere
type (coords_3d) :: centre
real::radius
end type sphere

contains
subroutine relationship(sphere1,sphere2)

type(sphere),intent(in)::sphere1,sphere2
real::distance_centres,sum_radius

distance_centres=sqrt((sphere1%centre%x-sphere2%centre%x)**2+&
(sphere1%centre%y-sphere2%centre%y)**2+&
(sphere1%centre%z-sphere2%centre%z)**2)

sum_radius=sphere1%radius+sphere2%radius

if (distance_centres>sum_radius) then
print*,"sphere1 and sphere2 separate."
else if (distance_centres==sum_radius) then
print*,"sphere1 and sphere2 touch."
else
print*,"sphere1 and sphere2 intersect."
end if

end subroutine relationship

end module Spheres_Apart_Module


program Spheres_Apart_User

use Spheres_Apart_Module
implicit none
type(sphere),dimension(:),allocatable::spheres
integer::ierr
allocate(spheres(1:4),stat=ierr)
if (ierr/=0) then
print*,"allocating memories for spheres failed."
stop
end if

spheres=(/sphere(coords_3d(3.0,4.0,5.0),3.0),&
sphere(coords_3d(10.0,4.0,5.0),4.0),&
sphere(coords_3d(3.0,-3.0,5.0),5.0),&
sphere(coords_3d(3.0,4.0,8.0),6.0)/)
call relationship(spheres(1),spheres(2))
if (allocated(spheres)) deallocate(spheres,stat=ierr)

end program Spheres_Apart_User

