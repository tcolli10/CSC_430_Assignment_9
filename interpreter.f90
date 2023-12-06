! interpreter.f90
module interpreter
    use ast
    implicit none

    contains

    function interp(expr) result(val)
        real :: val
        class(ExprC) :: expr

        val = 0
        
        select type (expr)
        type is (NumC)
            print *, "given NumC: ", expr%n
        type is (StrC)
            print *, "given StrC: ", expr%s
        class default
            print *, "unknown expr type"
        end select
    end function interp

end module interpreter
