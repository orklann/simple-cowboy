-module(hello_handler).
-behavior(cowboy_handler).

-export([init/2, terminate/3]).

init(Req0, State) ->
    TemplateFile = "/home/rkt/code/erl/simple_web/templates/index.html",
    erlydtl:compile_file(TemplateFile, index), 
    {ok, Body} = index:render([
            {title, "Johnny"},
            {message, "I am a message"}
        ]),
    Req = cowboy_req:reply(200, #{<<"content-type">> => <<"text/html">>}, Body, Req0),
    {ok, Req, State}.

terminate(_Reason, _Req, _State) ->
    ok.
