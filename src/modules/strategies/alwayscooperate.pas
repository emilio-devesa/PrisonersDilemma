{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    always_cooperate.pas
    Strategy: Always Cooperate
}
module AlwaysCooperate;

export  AlwaysCooperate = (
            Decide
);

import  shared qualified;
        player qualified;

function Decide(p: player.tPlayer): shared.tAction;

end;

function Decide;
begin
    Decide := shared.Cooperate;
end;

end.
