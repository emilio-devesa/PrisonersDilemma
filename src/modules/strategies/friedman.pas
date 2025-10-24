{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    friedman.pas
    Friedman: Cooperate unless the opponent has defected in any past round up to 'round-1'
}
module Friedman;

export  Friedman = (
            Decide
);

import  shared qualified;
        player qualified;

function Decide(p, opp: player.tPlayer; round: integer): shared.tAction;

end;

function Decide;
var i: integer; grimTriggered: boolean value false;
begin
    for i := 1 to round-1 do
        if opp.History[i] = shared.Defect
        then grimTriggered := true;
    if grimTriggered
    then Decide := shared.Defect
    else Decide := shared.Cooperate;
end;

end.
