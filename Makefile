PREFIX?=/usr/local
CLI_NAME = autobahn
LIB_NAME = libAutobahnDescription.dylib

all: build install

build:
	swift build --enable-prefetching -c release -Xswiftc -static-stdlib

install: install_bin install_lib

install_bin:
	mkdir -p $(PREFIX)/bin
	install .build/Release/$(CLI_NAME) $(PREFIX)/bin

install_lib:
	mkdir -p $(PREFIX)/lib
	install .build/Release/$(LIB_NAME) $(PREFIX)/lib

uninstall:
	rm -f $(INSTALL_PATH)