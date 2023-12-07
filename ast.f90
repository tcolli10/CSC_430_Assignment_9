module ast
    implicit none

type :: ExprC
end type ExprC

type :: Symbol
  character(:), allocatable :: symb
end type Symbol


type, extends(ExprC) :: NumC
  integer :: n
end type NumC


type, extends (ExprC) :: StrC
  character(:), allocatable :: s
end type StrC

! changed to just contain a symbol for the operand, and two args
type, extends (ExprC) :: AppC
  character :: fun
  type(NumC) :: arg1
  type(NumC) :: arg2
end type AppC

type, extends(ExprC) :: IdC
  type(Symbol) :: n
end type IdC

! if true, 1, otherwise 0
type, extends (ExprC) :: LamC
  type(Symbol), allocatable :: params
  type(ExprC) :: body
end type LamC

type, extends(ExprC) :: BoolC
  integer :: b
end type BoolC

type, extends (ExprC) :: IfC
  type(BoolC) :: cond
  type(NumC) :: then, else
end type IfC

type :: NumV
  real :: n
end type NumV

type :: BoolV
  logical :: bool
end type BoolV

type :: StrV
  character(:), allocatable :: s
end type StrV

type :: Value
  character :: type
  type(NumV) :: n
  type(BoolV) :: b
  type(StrV) :: s
end type Value

type :: Binding
    type(Symbol), allocatable :: symb
    type(Value) :: val
end type Binding

type :: Env
    type(Binding), allocatable :: bindings
end type Env

type :: CloV
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