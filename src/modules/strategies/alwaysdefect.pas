{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    alwaysdefect.pas
    AlwasyDefect: Always defect regardless of opponent and round
}
module AlwaysDefect;

export  AlwaysDefect = (
            Decide
);

import  shared qualified;
        player qualified;

function Decide(p, opp: player.tPlayer; round: integer): shared.tAction;

end;

function Decide;
begin
    Decide := shared.Defect;
end;

end.