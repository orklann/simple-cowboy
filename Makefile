PROJECT = simple_web
PROJECT_DESCRIPTION = New project
PROJECT_VERSION = 0.1.0
REL_DEPS += relx
DEPS = cowboy
dep_cowboy_commit = master
DEP_PLUGINS = cowboy

include erlang.mk
