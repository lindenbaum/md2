md2
===

An erlang implementation of the MD2 algorithm according to RFC 1319.

This library application contains an erlang-only implementation as
well as a NIF-based implementation of MD2. The NIF based implementation
needs libcryto (from [OpenSSL](http://www.openssl.org/)) to work. If
the NIF can't be loaded the erlang implementation (slower) will be used.

The project is built using [rebar](https://github.com/basho/rebar).
