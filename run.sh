#!/usr/bin/env bash

set -x

zig cc -target x86_64-linux-musl ./bin/college.o -o ./bin/college -static -L$PWD/x86_64-linux-musl -lgmp -lyaml -lz `command -v pkg-config > /dev/null && pkg-config --libs --silence-errors libssl || printf %s '-lssl -lcrypto'` `command -v pkg-config > /dev/null && pkg-config --libs --silence-errors libcrypto || printf %s '-lcrypto'` -lpcre2-8 -lgc -lpthread -ldl -levent -lunwind
