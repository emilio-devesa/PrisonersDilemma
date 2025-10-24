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
        player qualified;

function Decide(p, opp: player.tPlayer; round: integer): shared.tAction;

end;

function Decide;
var ts: TimeStamp; seed: integer;
begin
    GetTimeStamp (ts);
    seed := (1103515245 * (ts.MicroSecond + ts.Second * 1000000) + 12345) mod 2147483648;
    if (seed mod 2) = 0
    then Decide := shared.Cooperate
    else Decide := shared.Defect;
end;

end.