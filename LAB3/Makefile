CC = gcc
CFLAGS = -O3 -Wall -fopenmp

TARGET = correlate
SOURCES = main.c correlate.c
OBJECTS = $(SOURCES:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJECTS)

%.o: %.c correlate.h
	$(CC) $(CFLAGS) -c $< -o $@

run: $(TARGET)
	./$(TARGET) 500 500 4

clean:
	rm -f $(TARGET) *.o

.PHONY: all clean run