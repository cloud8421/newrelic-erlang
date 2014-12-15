# Adapted from https://github.com/devinus/markdown/blob/master/Makefile
CFLAGS = -g -O3 -ansi -pedantic -Wall -Wextra -Wno-unused-parameter

ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
CFLAGS += -I$(ERLANG_PATH) -I ./include
LDFLAGS = -L$(PWD)/priv -lnewrelic-collector-client -lnewrelic-common -lnewrelic-transaction

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
	LD_LIBRARY_PATH=./priv:$LD_LIBRARY_PATH bin/rebar shell

start_daemon:
	bin/start-daemon.sh

priv/newrelic.so: src/newrelic.c
	$(CC) $(CFLAGS) $(LDFLAGS) src/newrelic.c -shared -o $@

clean:
	$(RM) priv/newrelic.so
