{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    always_defect.pas
    Strategy: Always Defect
}
module AlwaysDefect;

export  AlwaysDefect = (
            Decide
);

import  shared qualified;
        player qualified;

function Decide(p: player.tPlayer): shared.tAction;

end;

function Decide;
begin
    Decide := shared.Defect;
end;

end.
