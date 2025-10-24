{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    player.pas
    Provides player data structure and initialization procedure
}
module player;

export  player = (
            tPlayer,
            Init,
            ResetHistory,
            HistoryToString
);

import  shared qualified;

type    tPlayer = record
            Name: string(255);
            Score: integer;
            Strategy: shared.tStrategy;
            History: array [1..shared.MAX_ROUNDS] of shared.tAction;
        end;

procedure Init(var p: tPlayer; n: string; s: shared.tStrategy);
procedure ResetHistory(var p: tPlayer);
procedure HistoryToString(var p: tPlayer; rounds: integer; var outStr: string);

end;

procedure Init;
begin
    p.Name := n;
    p.Strategy := s;
    p.Score := 0;
    ResetHistory(p);
end;

procedure ResetHistory;
var i: integer;
begin
    for i := 1 to shared.MAX_ROUNDS do p.History[i] := shared.Cooperate; { initialize to Cooperate }
end;

procedure HistoryToString;
var i: integer; ch: string(1);
begin
    outStr := '';
    if rounds in [1..shared.MAX_ROUNDS]
    then begin
        for i := 1 to rounds do begin
            if p.History[i] = shared.Cooperate then ch := 'C' else ch := 'D';
            if i = 1
            then outStr := ch 
            else outStr := outStr + '-' + ch;
        end;
    end;
end;

end.