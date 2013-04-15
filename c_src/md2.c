/**
 * Copyright (c) 2012 Lindenbaum GmbH
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 * A small erlang NIF using the MD2 implementation as provided by RFC 1319.
 */

#include <string.h>

#include "md2.h"

#include "erl_nif.h"

static ERL_NIF_TERM hash(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  ErlNifBinary binary;
  if (!enif_inspect_binary(env, argv[0], &binary)) {
    return enif_make_badarg(env);
  }

  MD2_CTX context;
  unsigned char digest[16];

  MD2Init(&context);
  MD2Update(&context, binary.data, binary.size);
  MD2Final(digest, &context);

  ErlNifBinary result;
  if (!enif_alloc_binary(16, &result)) {
    return enif_make_badarg(env);
  }

  memcpy(result.data, &digest, 16);
  return enif_make_binary(env, &result);
}

static ErlNifFunc nif_funcs[] = { {"hash", 1, hash} };

ERL_NIF_INIT(md2, nif_funcs, NULL, NULL, NULL, NULL)
