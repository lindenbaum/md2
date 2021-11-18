md2
===

An Erlang implementation of the MD2 algorithm according to RFC 1319.

Summary
-------

This OTP library application contains an erlang-only implementation as
well as a NIF-based implementation of MD2. The NIF based implementation
is taken from the code provided directly in RFC 1319. If the NIF can't be
loaded the erlang implementation (slower) will be used.

Building
--------

The project is built using [rebar](https://github.com/basho/rebar).

To use this project as a dependency, just add the following to the `deps`
section of your `rebar.config`:
```erlang
{md2, "1.1.1", {git, "https://github.com/lindenbaum/md2.git", {tag, "1.1.1"}}}
```
or if your project uses `rebar3`, get it directly from [https://hex.pm](hex.pm).

Usage
-----

To compute the MD2 digest of a binary call `md2:hash(Binary)`.
