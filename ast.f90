module ast
    implicit none

type :: ExprC
end type ExprC

type :: Value 
end type Value 


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

type :: Binding
    type(Symbol), allocatable :: symb
    type(Value) :: val
end type Binding

type :: Env
    type(Binding), allocatable :: bindings
end type Env

type, extends(Value) :: NumV
  real :: n
end type NumV

type, extends(Value) :: BoolV
  logical :: bool
end type BoolV

type, extends(Value) :: StrV
  character(:), allocatable :: s
end type StrV

type, extends(Value) :: CloV
  type(Symbol), allocatable :: params
  type(ExprC) :: body 
  type(Env) :: env
end type CloV

type :: ValidPrimOps
end type ValidPrimOps

type, extends (ValidPrimOps) :: PrimPlus
    type(Symbol) :: plus
end type PrimPlus

type, extends (ValidPrimOps) :: PrimMinus
    type(Symbol) :: minus
end type PrimMinus

type, extends (ValidPrimOps) :: PrimMultiply
    type(Symbol) :: multiply
end type PrimMultiply

type, extends (ValidPrimOps) :: PrimDivide
    type(Symbol) :: divide
end type PrimDivide

type, extends (ValidPrimOps) :: PrimLEQ
    type(Symbol) :: divide
end type PrimLEQ

type, extends (ValidPrimOps) :: PrimEqual
    type(Symbol) :: equal
end type PrimEqual

type, extends (ValidPrimOps) :: PrimError
    type(Symbol) :: error
end type PrimError

type, extends(Value) :: PrimV
  type(ValidPrimOps) :: prim
end type PrimV

end module ast