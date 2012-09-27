%%%=============================================================================
%%% Copyright (c) 2012 Lindenbaum GmbH
%%%
%%% Permission to use, copy, modify, and/or distribute this software for any
%%% purpose with or without fee is hereby granted, provided that the above
%%% copyright notice and this permission notice appear in all copies.
%%%
%%% THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
%%% WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
%%% MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
%%% ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
%%% WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
%%% ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
%%% OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
%%%=============================================================================

-module(md2_test).

-include_lib("eunit/include/eunit.hrl").

%%%=============================================================================
%%% TESTS
%%%=============================================================================

hash_empty_test() ->
    Digest = "8350e5a3e24c153df2275c9f80692773",
    Bin = <<>>,
    ?assertEqual(Digest, to_string(md2:loop(Bin))),
    ?assertEqual(Digest, to_string(md2:hash(Bin))).

hash_a_test() ->
    Digest = "32ec01ec4a6dac72c0ab96fb34c0b5d1",
    Bin = <<"a">>,
    ?assertEqual(Digest, to_string(md2:loop(Bin))),
    ?assertEqual(Digest, to_string(md2:hash(Bin))).

hash_abc_test() ->
    Digest = "da853b0d3f88d99b30283a69e6ded6bb",
    Bin = <<"abc">>,
    ?assertEqual(Digest, to_string(md2:loop(Bin))),
    ?assertEqual(Digest, to_string(md2:hash(Bin))).

hash_message_digest_test() ->
    Digest = "ab4f496bfb2a530b219ff33031fe06b0",
    Bin = <<"message digest">>,
    ?assertEqual(Digest, to_string(md2:loop(Bin))),
    ?assertEqual(Digest, to_string(md2:hash(Bin))).

hash_15chars_test() ->
    Digest = "de55ecdd23edf68b25b0b14d3d95fe06",
    Bin = <<"012345678901234">>,
    ?assertEqual(Digest, to_string(md2:loop(Bin))),
    ?assertEqual(Digest, to_string(md2:hash(Bin))).

hash_16chars_test() ->
    Digest = "4c13aeb6bc05a52e1c8b658c93088a39",
    Bin = <<"0123456789012345">>,
    ?assertEqual(Digest, to_string(md2:loop(Bin))),
    ?assertEqual(Digest, to_string(md2:hash(Bin))).

hash_17chars_test() ->
    Digest = "b1eca9ec65e8ff8b2a079ba458c8f165",
    Bin = <<"01234567890123456">>,
    ?assertEqual(Digest, to_string(md2:loop(Bin))),
    ?assertEqual(Digest, to_string(md2:hash(Bin))).

hash_alphabet_test() ->
    Digest = "4e8ddff3650292ab5a4108c3aa47940b",
    Bin = <<"abcdefghijklmnopqrstuvwxyz">>,
    ?assertEqual(Digest, to_string(md2:loop(Bin))),
    ?assertEqual(Digest, to_string(md2:hash(Bin))).

hash_alphabet_and_digits_test() ->
    Digest = "da33def2a42df13975352846c30338cd",
    Bin = <<"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789">>,
    ?assertEqual(Digest, to_string(md2:loop(Bin))),
    ?assertEqual(Digest, to_string(md2:hash(Bin))).

hash_random_test() ->
    Digest = "d5976f79d83d3a0dc9806c3c66f3efd8",
    Bin = <<"12345678901234567890123456789012345678901234567890123456789012345678901234567890">>,
    ?assertEqual(Digest, to_string(md2:loop(Bin))),
    ?assertEqual(Digest, to_string(md2:hash(Bin))).

%%%=============================================================================
%%% Internal functions
%%%=============================================================================

to_string(Binary) ->
    lists:flatten(
      [io_lib:format("~2.16.0b", [XI]) || XI <- binary_to_list(Binary)]).
