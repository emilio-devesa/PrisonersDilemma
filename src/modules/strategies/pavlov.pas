{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    pavlov.pas
    Pavlov (Win-Stay, Lose-Shift): Cooperate on first round. If last outcome was mutual cooperation or mutual defection, repeat previous move; otherwise, switch.
}
module Pavlov;

export  Pavlov = (
            Decide
);

import  shared qualified;
        player qualified;

function Decide(p, opp: player.tPlayer; round: integer): shared.tAction;

end;

function Decide;
begin
    if round <= 1
    then Decide := shared.Cooperate
    else begin
        if p.History[round-1] = opp.History[round-1]
        then Decide := p.History[round-1]
        else begin
            if p.History[round-1] = shared.Cooperate
            then Decide := shared.Defect
            else Decide := shared.Cooperate;
        end;
    end;
end;

end.