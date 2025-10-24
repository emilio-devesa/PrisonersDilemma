{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    random.pas
    Random: Randomly cooperate or defect each round
}
module Random;

export  Random = (
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
    n := utils.RandomInt(100);
    if (n mod 2) = 0
    then Decide := shared.Cooperate
    else Decide := shared.Defect;
end;

end.