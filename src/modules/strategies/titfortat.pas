{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    titfortat.pas
    TitForTat: Cooperate on first round; otherwise copy opponent's previous action
}
module TitForTat;

export  TitForTat = (
            Decide
);

import  shared qualified;
        player qualified;

function Decide(p, opp: player.tPlayer; round: integer): shared.tAction;

end;

function Decide;
begin
    if round <= 1 then
        Decide := shared.Cooperate
    else
        Decide := opp.History[round-1];
end;

end.