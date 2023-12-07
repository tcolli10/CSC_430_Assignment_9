module assert
    implicit none
    public assertNumber
    public assertBoolean

contains
    subroutine assertBoolean(actual, expected) 
        implicit none
        logical, intent(in) :: expected
        logical, intent(in) :: actual

        if (actual .eqv. expected) then
            print *, "Correct!"
            print *, "Expected: ", expected
            print *, "Actual  : ", actual
        else
            print *, "Incorrect!"
            print *, "Expected: ", expected
            print *, "Actual  : ", actual
        endif

    end subroutine assertBoolean

    subroutine assertNumber(actual, expected) 
        implicit none
        real, intent(in) :: expected
        real, intent(in) :: actual

        if (actual == expected) then
            print *, "Correct!"
            print *, "Expected: ", expected
            print *, "Actual  : ", actual
            print *, ""

        else            
            print *, "Incorrect!"
            print *, "Expected: ", expected
            print *, "Actual  : ", actual
            print *, ""

        endif
    
    end subroutine assertNumber

    subroutine assertString(actual, expected)
        implicit none
        character(len=*), intent(in) :: expected
        character(len=*), intent(in) :: actual
    
        if (actual == expected) then
            print *, "Correct!"
            print *, "Expected: ", expected
            print *, "Actual  : ", actual
            print *, ""
        else
            print *, "Incorrect!"
            print *, "Expected: ", expected
            print *, "Actual  : ", actual
            print *, ""
        endif
    
    end subroutine assertString
    
end module assert
        

