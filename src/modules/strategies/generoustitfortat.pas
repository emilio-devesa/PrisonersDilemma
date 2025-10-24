{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    generoustitfortat.pas
    Generous TitForTat: Cooperate on first round; otherwise copy opponent's previous move, but forgive a defection with 10% probability.
}
module GenerousTitForTat;

export  GenerousTitForTat = (
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
        if opp.History[round-1] = shared.Defect
        then begin
            n := utils.RandomInt(100);
            if n < 10
            then Decide := shared.Cooperate
            else Decide := shared.Defect;
        end
        else Decide := shared.Cooperate;
    end;
end;

end.