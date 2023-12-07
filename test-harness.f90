module assert
    implicit none
    public assertNumber
    public assertBoolean

contains
    function assertBoolean(actual, expected) result(correct)
        implicit none
        logical, intent(in) :: expected
        logical, intent(in) :: actual
        logical :: correct

        if (actual .eqv. expected) then
            correct = .true.
            print *, "Correct!"
            print *, "Expected: ", expected
            print *, "Actual  : ", actual
        else
            correct = .false.
            print *, "Incorrect!"
            print *, "Expected: ", expected
            print *, "Actual  : ", actual
        endif

    end function assertBoolean

    function assertNumber(actual, expected) result(correct)
        implicit none
        integer, intent(in) :: expected
        integer, intent(in) :: actual
        logical :: correct

        if (actual == expected) then
            correct = .true.
            print *, "Correct!"
            print *, "Expected: ", expected
            print *, "Actual  : ", actual
            print *, ""

        else
            correct = .false.
            
            print *, "Incorrect!"
            print *, "Expected: ", expected
            print *, "Actual  : ", actual
            print *, ""

        endif
    
    end function assertNumber
end module assert
        

