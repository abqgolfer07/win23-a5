# Compiler 
CC = gcc

# Compiler flags for error checking, debugging, and warnings
CFLAGS = -Wall -Werror -g

# Target executable
TARGET = calculator

# Source files
SRCS = main.c addition.c subtraction.c multiplication.c division.c

# Object files (compiled source files)
OBJS = $(SRCS:.c=.o)

# Default target to build the executable
all: $(TARGET)

# Link the object files into the executable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

# Compile the source files into object files
%.o: %.c operations.h
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up the compiled object files and the executable
clean:
	rm -f $(TARGET) $(OBJS)
