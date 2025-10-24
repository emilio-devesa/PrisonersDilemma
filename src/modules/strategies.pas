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
        Friedman qualified;
        Random qualified;
        TitForTat qualified;
        TitForTwoTats qualified;

function DecideAction(p, opponent: player.tPlayer; round: integer): shared.tAction;

end;

function DecideAction;
begin
    case p.Strategy of
        shared.AlwaysCooperate: DecideAction := AlwaysCooperate.Decide(p, opponent, round);
        shared.AlwaysDefect:    DecideAction := AlwaysDefect.Decide(p, opponent, round);
        shared.Friedman:        DecideAction := Friedman.Decide(p, opponent, round);
        shared.Random:          DecideAction := Random.Decide(p, opponent, round);
        shared.TitForTat:       DecideAction := TitForTat.Decide(p, opponent, round);
        shared.TitForTwoTats:   DecideAction := TitForTwoTats.Decide(p, opponent, round);
    end;
end;

end.