! File: timestep_filename_construction.f90
! Purpose: Illustrate number-to-string conversions using internal files;
!          specifically, this program employs this technique to construct output
!          file-names based on the iteration-number in a hypothetical numerical
!          model.

program timestep_filename_construction
  implicit none
  character(40) :: auxString, aux_strng="" ! internal file (=string)
  integer :: i, j,numTimesteps = 10, speedFileID


  ! do is for looping over an integer interval (discussed soon)
  do i=1, numTimesteps
     ! write timestep into auxString
     write(auxString, '(i0)') i

     ! print*,int(log10(real(numTimesteps)))-int(log10(real(i)))

     ! write padding zero into aux_strng
     do j=1,int(log10(real(numTimesteps)))-int(log10(real(i)))
        aux_strng=trim(adjustl(aux_strng)) // "0" ! I choose not using Internal Files here
                                   ! for simplicity.
     end do

     ! open file for writing, with custom filename
     open(newunit=speedFileID, &
          file="speed_" // trim(adjustl(aux_strng)) // trim(adjustl(auxString)) // ".dat", &
          action="write")

     ! here, we would have model-code, for computing the speed and writing
     ! it to file...

     close(speedFileID)

     ! Rewind aux_strng to ""
     aux_strng=""

  end do
end program timestep_filename_construction

