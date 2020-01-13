
all: clean install

install:
	chicken-install

clean:
	rm -f *.so *.o *.link *.import.scm

PHONY: all install clean
