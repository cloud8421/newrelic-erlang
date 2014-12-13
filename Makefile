# Adapted from https://github.com/devinus/markdown/blob/master/Makefile
CFLAGS = -g -O3 -ansi -pedantic -Wall -Wextra -Wno-unused-parameter

ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
CFLAGS += -I$(ERLANG_PATH)

ifneq ($(OS),Windows_NT)
	CFLAGS += -fPIC

	ifeq ($(shell uname),Darwin)
		LDFLAGS += -dynamiclib -undefined dynamic_lookup
	endif
endif

.PHONY: all clean newrelic shell

all: priv/newrelic.so newrelic

newrelic:
	bin/rebar compile

shell:
	bin/rebar shell

priv/newrelic.so: src/newrelic.c
	$(CC) $(CFLAGS) -shared $(LDFLAGS) -o $@ src/newrelic.c

clean:
	$(RM) priv/newrelic.so
