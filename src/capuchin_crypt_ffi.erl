-module(capuchin_crypt_ffi).
-export([crypt_erase/1, crypt_get/1, crypt_put/2]).

crypt_erase(Key) ->
    persistent_term:erase({capuchin_crypt, Key}).

crypt_get(Key) ->
    try persistent_term:get({capuchin_crypt, Key}) of
        Val -> {ok, Val}
    catch
        error:badarg -> {error, nil}
    end.

crypt_put(Key, Val) ->
    persistent_term:put({capuchin_crypt, Key}, Val),
    persistent_term:get({capuchin_crypt, Key}).
