#include "erl_nif.h"
#include "newrelic_common.h"
#include "newrelic_transaction.h"
#include "newrelic_collector_client.h"

static ERL_NIF_TERM transaction_begin_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
  long transaction_id = newrelic_transaction_begin();
  return enif_make_int(env, transaction_id);
}

/* transaction_id::long, name::char */
static ERL_NIF_TERM transaction_set_name_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
  long transaction_id;

  if (!enif_get_long(env, argv[0], &transaction_id)) {
    return enif_make_badarg(env);
  }

  if (!enif_is_list(env, argv[1])) {
    return enif_make_badarg(env);
  }

  newrelic_transaction_set_name(transaction_id, argv[1]);
  return enif_make_atom(env, "ok");
}

static ErlNifFunc nif_funcs[] = {
  {"transaction_begin", 0, transaction_begin_nif},
  {"transaction_set_name", 2, transaction_set_name_nif}
};

ERL_NIF_INIT(newrelic, nif_funcs, NULL, NULL, NULL, NULL)
