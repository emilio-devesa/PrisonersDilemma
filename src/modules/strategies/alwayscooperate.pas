{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    alwayscooperate.pas
    AlwaysCooperate: Always cooperate regardless of opponent and round
}
module AlwaysCooperate;

export  AlwaysCooperate = (
            Decide
);

import  shared qualified;
        player qualified;

function Decide(p, opp: player.tPlayer; round: integer): shared.tAction;

end;

function Decide;
begin
    Decide := shared.Cooperate;
end;

end.