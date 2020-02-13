% Licensed under the Apache License, Version 2.0 (the "License"); you may not
% use this file except in compliance with the License. You may obtain a copy of
% the License at
%
%   http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
% WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
% License for the specific language governing permissions and limitations under
% the License.


-module(mango_fdb_view).


-export([
    start_key_opts/2,
    end_key_opts/2
]).

start_key_opts([], _StartKeyDocId) ->
    [];

start_key_opts(StartKey, StartKeyDocId) ->
    io:format("STARTKEY ~p ~n", [StartKey]),
    StartKey1 = couch_views_encoding:encode(StartKey, key),
    [{start_key, {StartKey1, StartKeyDocId}}].


end_key_opts([], _EndKeyDocId) ->
    [];

end_key_opts(EndKey, EndKeyDocId) ->
    io:format("ENDKEY ~p ~n", [EndKey]),
    EndKey1 = couch_views_encoding:encode(EndKey, key),
    [{end_key, {EndKey1, EndKeyDocId}}].
