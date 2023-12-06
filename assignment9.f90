program MainProgram
    use ast 
    use interpreter
    use assert
    implicit none

    type(NumC) :: testNum
    type(StrC) :: testStr
    real :: placeholder
    integer :: testInt
    logical :: testResult
  
    testInt = 5
    testNum%n = 5
    testStr%s = "hello world"
  
    ! Print the values
    placeholder = interp(testNum)
    placeholder = interp(testStr)

    ! testing asserts
    testResult = assertNumber(testInt, testInt)
    testResult = assertBoolean(testResult, testResult)

  end program MainProgram
  