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

-module(guards2).

-export([start/0, do_something/1]).

start() ->
    do_something([]) + do_something(<<1, 2, 3>>) + do_something(2).

do_something(S) when is_pid(S) ->
    1;
do_something(S) when is_port(S) ->
    2;
do_something(S) when is_integer(S) ->
    4;
do_something(S) when is_number(S) ->
    8;
do_something(S) when is_list(S) ->
    16;
do_something(S) when is_binary(S) ->
    16;
do_something(S) when is_atom(S) ->
    32.
