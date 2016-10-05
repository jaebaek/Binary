all: main

main: main.o gas.o

main.o: main.c
	$(CC) -c $<

gas.o: gas.s
	$(CC) -c $<

clean:
	rm -f *.o main
