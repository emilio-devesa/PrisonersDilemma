{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    strategies.pas
    Provides strategy decision functions
}
module strategies;

export  strategies = (
            DecideAction
);

import  shared qualified;
        player qualified;

function DecideAction(p: player.tPlayer): shared.tAction;

end;

function DecideAction;
begin
    case p.Strategy of
        shared.AlwaysCooperate: DecideAction := shared.Cooperate;
        shared.AlwaysDefect:    DecideAction := shared.Defect;
    end;
end;

end.