-module(simple_web_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).
-export([get_temaplate_path/1]).

-define(APP_PATH, "/home/rkt/code/erl/simple_web").

get_temaplate_path(File) ->
    AppPath = ?APP_PATH,
    TemplatePath = filename:join(AppPath, "templates"),
    filename:join(TemplatePath, File).

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/", hello_handler, []}]}
    ]),
    {ok, _} = cowboy:start_clear(my_http_listener,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}
    ),
    simple_web_sup:start_link().

stop(_State) ->
	ok.
