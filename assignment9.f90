! File: main_program.f90

program MainProgram
    ! Use the module containing the type definitions
    use ast
  
    ! Declare a variable of the structure type
    type(NumC) :: testNum
  
    ! Assign values to the structure fields
    testNum%n = 1.0
  
    ! Print the values
    print *, "x =", testNum%n
  end program MainProgram
  