! interpreter.f90
module interpreter
    use ast
    implicit none

    contains 

    function interp(expr) result(val)
        implicit none
        class(ExprC), intent(in) :: expr
        ! use int to be compatible with asserts
        integer :: val
        
        select type (expr)
        type is (NumC)
            print *, "given NumC: ", expr%n
            val = expr%n
        type is (StrC)
            print *, "given StrC: ", expr%s
        type is (AppC)
            if (expr%fun == '+') then
                ! write a getter to grab args from struct
                val = expr%arg1 + expr%arg2
            endif

        class default
            print *, "unknown expr type"
        end select
    end function interp

end module interpreter
