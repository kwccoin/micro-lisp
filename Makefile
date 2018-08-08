.PHONY: clean stats test

# remove the ? from ?= gcc  ... still not working as stddup is c++???

CC = gcc 
CFLAGS = -std=c99 -Wall
# CFLAGS += -Wall -pedantic -O2 -g

#minimum: micro-lisp

all: clean mlisp89 stats test

micro-lisp: micro-lisp.c
	$(CC) $(CFLAGS) -o $@ $^

mlisp89: mlisp89.c
	$(CC) $(CFLAGS) -ansi -std=c89 -D_DEFAULT_SOURCE -o $@ $^

stats: mlisp89.c
	wc $^

test: mlisp89
	./test.sh ./mlisp89

clean:
	@rm -fv micro-lisp mlisp89
