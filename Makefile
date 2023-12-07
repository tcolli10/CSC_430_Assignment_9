COMPILER = gfortran
FLAGS = -Wall

my_program: ast.o interpreter.o test-harness.o assignment9.o
	$(COMPILER) $(FLAGS) assignment9.o ast.o interpreter.o test-harness.o -o my_program

assignment9.o: assignment9.f90
	$(COMPILER) $(FLAGS) -c assignment9.f90 -o assignment9.o

ast.o: ast.f90
	$(COMPILER) $(FLAGS) -c ast.f90 -o ast.o

interpreter.o: interpreter.f90
	$(COMPILER) $(FLAGS) -c interpreter.f90 -o interpreter.o

test-harness.o: test-harness.f90
	$(COMPILER) $(FLAGS) -c test-harness.f90 -o test-harness.o

clean:
	rm -rf *.o *.mod my_program
