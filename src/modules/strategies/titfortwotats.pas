{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    titfortwotats.pas
    TitForTwoTats: Cooperate in rounds 1 and 2. From round > 2 defect only if opponent defected in both of the previous two rounds.
}
module TitForTwoTats;

export  TitForTwoTats = (
            Decide
);

import  shared qualified;
        player qualified;

function Decide(p, opp: player.tPlayer; round: integer): shared.tAction;

end;

function Decide;
begin
    if round <= 2
    then Decide := shared.Cooperate
    else begin
        if (opp.History[round-1] = shared.Defect) and_then (opp.History[round-2] = shared.Defect)
        then Decide := shared.Defect
        else Decide := shared.Cooperate;
    end;
end;

end.
