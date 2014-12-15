-module(newrelic).
-export([power/1, begin_transaction/0]).

-on_load(init/0).

init() ->
  Path = filename:join(code:priv_dir(newrelic), "newrelic"),
  ok = erlang:load_nif(Path, 0).

power(_X) ->
  exit(nif_library_not_loaded).

begin_transaction() ->
  exit(nif_library_not_loaded).
