SRC = writer.c
TARGET = writer
CROSS_COMPILE ?=

link: compile
	${CROSS_COMPILE}gcc writer.o -o $(TARGET)
	@echo "Compilation Finished"

compile:
	${CROSS_COMPILE}gcc -c -Wall $(SRC) -o writer.o

main:
	@echo "compilations completed"

clean:
	rm -f $(TARGET) writer.o
	@echo "Cleaned up"

