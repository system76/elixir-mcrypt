ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
CFLAGS = -g -O3 -pedantic -Wall -Wextra -std=c99 -I$(ERLANG_PATH)

ifneq ($(OS),Windows_NT)
	CFLAGS += -fPIC

	ifeq ($(shell uname),Darwin)
		LDFLAGS += -dynamiclib -undefined dynamic_lookup
	endif
endif

priv/lib_mcrypt.so: clean
	@$(CC) $(CFLAGS) -shared $(LDFLAGS) -o $@ \
		c_src/mcrypt_nif.c \
		-lmcrypt

clean:
	@$(RM) -r priv/*
