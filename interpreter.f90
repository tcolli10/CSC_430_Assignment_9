! interpreter.f90
module interpreter
    use ast
    implicit none

    contains 

    recursive function interp(expr) result(val)
        implicit none
        class(ExprC), intent(in) :: expr
        ! use int to be compatible with asserts
        integer :: val
        character(:), allocatable :: str
        character(:), allocatable :: symb
        
        select type (expr)
        type is (NumC)
            print *, "given NumC: ", expr%n
            val = expr%n
        type is (StrC)
            print *, "given StrC: ", expr%s
            str = expr%s
        type is (IdC)
            print *, "given IdC: ", expr%n%symb
            symb = expr%n%symb
        type is (BoolC)
            if (expr%b == 1) then
                val = 1
            else
                val = 0
            endif
        type is (AppC)
            if (expr%fun == '+') then
                ! write a getter to grab args from struct
                val = expr%arg1%n + expr%arg2%n
            else if (expr%fun == '-') then
                val = expr%arg1%n - expr%arg2%n
            else if (expr%fun == '*') then
                val = expr%arg1%n * expr%arg2%n
            else if (expr%fun == '/') then
                val = expr%arg1%n / expr%arg2%n
            endif
        type is (IfC)
            if (interp(expr%cond) == 1) then
                val = interp(expr%then)
            else 
                val = interp(expr%else)
            endif
                    
            

        class default
            print *, "unknown expr type"
        end select
    end function interp

end module interpreter
