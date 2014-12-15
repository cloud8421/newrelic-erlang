#include "erl_nif.h"
#include "newrelic_common.h"
#include "newrelic_transaction.h"
#include "newrelic_collector_client.h"

static ERL_NIF_TERM transaction_begin_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
  long transaction_id = newrelic_transaction_begin();
  return enif_make_int(env, transaction_id);
}

static ERL_NIF_TERM begin_transaction_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
  long transaction_id = newrelic_transaction_begin();
  return enif_make_int(env, transaction_id);
}

static ErlNifFunc nif_funcs[] = {
  {"transaction_begin", 0, transaction_begin_nif}
};

ERL_NIF_INIT(newrelic, nif_funcs, NULL, NULL, NULL, NULL)
