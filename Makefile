# Makefile

# Compiler and flags
FC = gfortran
FFLAGS = -Wall -Wextra

# Executable name
EXECUTABLE = my_program

# Source files
SRCS = ast.f90 assignment9.f90

# Object files
OBJS = $(SRCS:.f90=.o)

# Rule to compile .f90 to .o
%.o: %.f90
	$(FC) $(FFLAGS) -c $< -o $@

# Default target
all: $(EXECUTABLE)

# Linking
$(EXECUTABLE): $(OBJS)
	$(FC) $(OBJS) -o $(EXECUTABLE)

# Clean target
clean:
	rm -f $(OBJS) $(EXECUTABLE)
