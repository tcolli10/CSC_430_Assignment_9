module assert
    implicit none
    public assertNumber
    public assertBoolean

contains
    function assertBoolean(expected, given) result(correct)
        implicit none
        logical, intent(in) :: expected
        logical, intent(in) :: given
        logical :: correct

        if (expected .eqv. given) then
            correct = .true.
            print *, "Correct!"
            print *, "Expected: ", expected
            print *, "Given   : ", given
        else
            correct = .false.
            print *, "Incorrect!"
            print *, "Expected: ", expected
            print *, "Given   : ", given
        endif

    end function assertBoolean

    function assertNumber(expected, given) result(correct)
        implicit none
        integer, intent(in) :: expected
        integer, intent(in) :: given
        logical :: correct

        if (expected == given) then
            correct = .true.
            print *, "Correct!"
            print *, "Expected: ", expected
            print *, "Given   : ", given
        else
            correct = .false.
            print *, "Incorrect!"
            print *, "Expected: ", expected
            print *, "Given   : ", given
        endif
    
    end function assertNumber
end module assert
        

