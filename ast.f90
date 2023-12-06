module ast
    implicit none

type :: ExprC
end type ExprC

type :: Symbol
  character(:), allocatable :: symb
end type Symbol


type, extends(ExprC) :: NumC
  real :: n
end type NumC


type, extends (ExprC) :: StrC
  character(:), allocatable :: s
end type StrC

type, extends (ExprC) :: AppC
  type(ExprC) :: fun
  type(ExprC), allocatable :: exprs
end type AppC

type, extends (ExprC) :: IfC
  type(ExprC) :: expr, then, else
end type IfC

type, extends(ExprC) :: IdC
  type(Symbol) :: n
end type IdC

type, extends (ExprC) :: LamC
  type(Symbol), allocatable :: params
  type(ExprC) :: body
end type LamC


end module ast