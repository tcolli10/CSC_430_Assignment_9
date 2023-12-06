! interpreter.f90
module interpreter
    use ast
    implicit none

    contains

    function interp(expr) result(val)
        real :: val
        type(NumC) :: expr
        
        val = expr%n
    end function interp

end module interpreter
