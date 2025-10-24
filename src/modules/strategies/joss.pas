{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    joss.pas
    Joss: Like Tit For Tat, but with a 10% probability of defection even after cooperation.
}
module Joss;

export  Joss = (
            Decide
);

import  shared qualified;
        utils qualified;
        player qualified;

function Decide(p, opp: player.tPlayer; round: integer): shared.tAction;

end;

function Decide;
var n: integer;
begin
    if round <= 1
    then Decide := shared.Cooperate
    else begin
        n := utils.RandomInt(100);
        if (opp.History[round-1] = shared.Cooperate) and_then (n < 10)
        then Decide := shared.Defect
        else Decide := opp.History[round-1];
    end;
end;

end.