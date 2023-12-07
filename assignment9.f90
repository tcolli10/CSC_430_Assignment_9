program MainProgram
    use ast 
    use interpreter
    use assert
    implicit none

    ! variable declaration
    type(NumC) :: testNum
    type(NumC) :: testNum3
    type(StrC) :: testStr
    type(IdC) :: testId
    real :: placeholder
    integer :: testInt
    logical :: testResult
    type(AppC) :: plus
    type(AppC) :: minus
    type(AppC) :: division
    type(AppC) :: multiply
  
    ! variable initialization
    testInt = 5
    testNum3 = NumC(3)
    testNum%n = 5
    testStr%s = "hello world"
    testId%n%symb = "x"
    plus = AppC("+", testNum, testNum)
    minus = AppC("-", testNum, testNum)
    division = AppC("%", testNum, testNum)
    multiply = AppC("*", testNum, testNum3)
  
    ! Print the values
    placeholder = interp(testNum)
    placeholder = interp(testStr)
    placeholder = interp(testId)

    ! do basic arithemetic
    testResult = assertNumber(interp(plus), 10)
    testResult = assertNumber(interp(minus), 0)
    testResult = assertNumber(interp(multiply), 15)
    testResult = assertNumber(interp(division), 1)

    ! testing asserts
    testResult = assertNumber(testInt, testInt)
    testResult = assertBoolean(testResult, testResult)

  end program MainProgram
  