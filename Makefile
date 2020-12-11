.phony: all clean install

all: build build/libnif.so

build:
	mkdir -p build

build/libnif.so: native/libnif.c
	$(CC) -o $@ $< -I/Users/zacky/.asdf/installs/erlang/23.1.5/usr/include -shared -dynamiclib -undefined dynamic_lookup -L/Users/zacky/.asdf/installs/erlang/23.1.5/usr/lib

install:
	cp -r build _build/dev/lib/elixir_make_test/priv

clean:
	$(RM) build/*