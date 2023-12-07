program MainProgram
    use assert
    use ast
    use interpreter
    implicit none
    

     ! variable declaration
    type(NumC) :: testNum
    type(NumC) :: testNum3
    type(StrC) :: testStr
    type(IdC) :: testId
    type(Value) :: returnVal
    real :: testInt
    type(AppC) :: plus
    type(AppC) :: minus
    type(AppC) :: division
    type(AppC) :: multiply
    type(IfC) :: i1
    type(IfC) :: i2

    ! variable initialization
    testInt = 5.0
    testNum3 = NumC(3)
    testNum%n = 5
    testStr%s = "hello world"
    testId%n%symb = "x"
    plus = AppC("+", testNum, testNum)
    minus = AppC("-", testNum, testNum)
    division = AppC("/", testNum, testNum)
    multiply = AppC("*", testNum, testNum3)

    i1 = IfC(BoolC(1), NumC(5), NumC(2))
    i2 = IfC(BoolC(0), NumC(5), NumC(2))

    ! Print the values
    returnval = interp(testNum)
    call assertNumber(returnVal%n%n, 5.0)
    returnval = interp(testStr)
    call assertString(returnVal%s%s, "hello world")

    ! still need to add env to lookup id
    !returnval = interp(testId)

    ! fix tests
    ! ! do basic arithemetic
    returnVal = interp(plus)
    call assertNumber(returnVal%n%n, 10.0)

    returnVal = interp(minus)
    call assertNumber(returnVal%n%n, 0.0)

    returnVal = interp(multiply)
    call assertNumber(returnVal%n%n, 15.0)

    returnVal = interp(division)
    call assertNumber(returnVal%n%n, 1.0)


    ! ! ifC statements
    returnVal = interp(i1)
    call assertNumber(returnVal%n%n, 5.0)

    returnVal = interp(i2)
    call assertNumber(returnVal%n%n, 2.0)

    ! testing asserts
    call assertNumber(testInt, testInt)
    call assertBoolean(.true., .true.)


  end program MainProgram
  