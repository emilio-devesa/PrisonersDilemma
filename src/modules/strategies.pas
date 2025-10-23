{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    strategies.pas
    Provides strategy selection
}
module strategies;

export  strategies = (
            DecideAction
);

import  shared qualified;
        player qualified;
        AlwaysCooperate qualified;
        AlwaysDefect qualified;

function DecideAction(p: player.tPlayer): shared.tAction;

end;

function DecideAction;
begin
    case p.Strategy of
        shared.AlwaysCooperate: DecideAction := AlwaysCooperate.Decide(p);
        shared.AlwaysDefect:    DecideAction := AlwaysDefect.Decide(p);
    end;
end;

end.