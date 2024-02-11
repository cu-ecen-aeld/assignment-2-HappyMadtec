SRC = writer.c
TARGET = writer
CROSS_COMPILE ?= 

link: compile
	${CROSS_COMPILE}gcc writer.o -o $(TARGET)
	echo "Compilation Finished"

compile:
	${CROSS_COMPILE}gcc -c -Wall $(SRC) -o writer.o

main:
	echo "Compilation finished"

clean:
	rm -f writer.o
	echo "Cleaned"

clean-all:
	rm -f writer.o
	rm -f writer
	
