-module(newrelic).
-export([transaction_begin/0]).

-on_load(init/0).

init() ->
  Path = filename:join(code:priv_dir(newrelic), "newrelic"),
  ok = erlang:load_nif(Path, 0).

transaction_begin() ->
  exit(nif_library_not_loaded).
