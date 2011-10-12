CFLAGS+=-ggdb
LDLIBS+=-ggdb

runtests: romantest
	./romantest

all: romantest

romantest: maintest.o romantest.o roman.o


clean:
	$(RM) romantest *.o *~
