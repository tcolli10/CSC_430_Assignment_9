program MainProgram
    use ast 
    use interpreter
    implicit none

  
    type(NumC) :: testNum
    type(StrC) :: testStr
    real :: placeholder
  
    testNum%n = 5
    testStr%s = "hello world"
  
    ! Print the values
    placeholder = interp(testNum)
    placeholder = interp(testStr)
  end program MainProgram
  