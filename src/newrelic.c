#include "erl_nif.h"
#include "newrelic_common.h"
#include "newrelic_transaction.h"
#include "newrelic_collector_client.h"

static ERL_NIF_TERM power_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
  int x, ret;
  if (!enif_get_int(env, argv[0], &x)) {
    return enif_make_badarg(env);
  }
  ret = x * x;
  return enif_make_int(env, ret);
}

static ERL_NIF_TERM begin_transaction_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
  long transaction_id = newrelic_transaction_begin();
  return enif_make_int(env, transaction_id);
}

static ErlNifFunc nif_funcs[] = {
  {"power", 1, power_nif},
  {"begin_transaction", 0, begin_transaction_nif}
};

ERL_NIF_INIT(newrelic, nif_funcs, NULL, NULL, NULL, NULL)
