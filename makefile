CC=gcc
CFLAGS=-L. -llibr

all : server client

server : server.c liblibr.so
	$(CC) -pthread -o server server.c $(CFLAGS)

client : client.c liblibr.so
	$(CC) -o client client.c $(CFLAGS)

liblibr.so : libr.o
	$(CC) -shared -o liblibr.so libr.o

libr.o : libr.c
	$(CC) -fPIC -c libr.c

clean :
	rm server client libr.o liblibr.so