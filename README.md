md2
===

An Erlang implementation of the MD2 algorithm according to RFC 1319.

Summary
-------

This OTP library application contains an erlang-only implementation as
well as a NIF-based implementation of MD2. The NIF based implementation
needs libcryto (from [OpenSSL](http://www.openssl.org/)) to work. If
the NIF can't be loaded the erlang implementation (slower) will be used.

Building
--------

The project is built using [rebar](https://github.com/basho/rebar).

To disable compilation and usage of the NIF based implementation (e.g.
for systems without OpenSSL) just remove the `port_specs` and `port_env`
configuration in the `rebar.config` file.

To use this project as a dependency, just add the following to the `deps`
section of your `rebar.config`:

`{md2, "1.0.0", {git, "https://github.com/lindenbaum/md2.git", {tag, md2-1.0.0}}}`

Usage
-----

To compute the MD2 digest of a binary call `md2:hash(Binary)`.
