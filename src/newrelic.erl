-module(newrelic).
-export([transaction_begin/0, transaction_set_name/2]).

-on_load(init/0).

init() ->
  Path = filename:join(code:priv_dir(newrelic), "newrelic"),
  ok = erlang:load_nif(Path, 0).

transaction_begin() ->
  exit(nif_library_not_loaded).

transaction_set_name(_Id, _Name) ->
  exit(nif_library_not_loaded).
