program MainProgram
    use ast 
    use interpreter
  
    type(NumC) :: testNum
  
    testNum%n = 5
  
    ! Print the values
    print *, "x =", interp(testNum)
  end program MainProgram
  