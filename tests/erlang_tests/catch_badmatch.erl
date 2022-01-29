%
% This file is part of AtomVM.
%
% Copyright 2018 Davide Bettio <davide@uninstall.it>
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
%    http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.
%
% SPDX-License-Identifier: Apache-2.0 OR LGPL-2.1-or-later
%

-module (catch_badmatch).
-export([start/0, f/1, do_badmatch/1]).

start() ->
    is_error(f(0)).

f(Value) ->
    try do_badmatch(Value) of
        AnyVal -> AnyVal
    catch
        _:_ -> error
    end.

do_badmatch(V) ->
    4 = V*2.

is_error(error) ->
    1;
is_error(Value) when is_integer(Value) ->
    0;
is_error(_Value) ->
    2.
