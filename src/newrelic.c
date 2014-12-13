#include "erl_nif.h"

static ERL_NIF_TERM power_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
  int x, ret;
  if (!enif_get_int(env, argv[0], &x)) {
    return enif_make_badarg(env);
  }
  ret = x * x;
  return enif_make_int(env, ret);
}

static ErlNifFunc nif_funcs[] = {
  {"power", 1, power_nif}
};

ERL_NIF_INIT(newrelic, nif_funcs, NULL, NULL, NULL, NULL)
