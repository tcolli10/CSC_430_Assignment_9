! interpreter.f90
module interpreter
    use ast
    implicit none

    contains 

    recursive function interp(expr) result(val)
        implicit none
        class(ExprC), intent(in) :: expr
        ! use int to be compatible with asserts
        type(Value) :: val
        character(:), allocatable :: symb
        type(Value) :: res
        
        select type (expr)
        type is (NumC)
            print *, "given NumC: ", expr%n
            val%n%n = expr%n
        type is (StrC)
            print *, "given StrC: ", expr%s
            val%s%s = expr%s
        type is (IdC)
            print *, "given IdC: ", expr%n%symb
            symb = expr%n%symb
        type is (BoolC)
            if (expr%b == 1) then
                val%b%bool = .true.
            else
                val%b%bool = .false.
            endif
        type is (AppC)
            if (expr%fun == '+') then
                ! write a getter to grab args from struct
                val%n%n = expr%arg1%n + expr%arg2%n
            else if (expr%fun == '-') then
                val%n%n = expr%arg1%n - expr%arg2%n
            else if (expr%fun == '*') then
                val%n%n = expr%arg1%n * expr%arg2%n
            else if (expr%fun == '/') then
                val%n%n = expr%arg1%n / expr%arg2%n
            endif
        type is (IfC)
            res = interp(expr%cond)
            if (res%b%bool .eqv. .true.) then
                val = interp(expr%then)
            else 
                val = interp(expr%else)
            endif
                    

        class default
            print *, "unknown expr type"
        end select
    end function interp

end module interpreter
