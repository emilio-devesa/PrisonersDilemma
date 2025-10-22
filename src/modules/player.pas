{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    player.pas
    Provides player data structure and initialization procedure
}
module player;

export  player = (
            tPlayer,
            Init
);

import  StandardOutput;
        shared qualified;

type    tPlayer = record
            Name: string(255);
            Score: integer;
            Strategy: shared.tStrategy;
        end;

procedure Init(var p: tPlayer; name: string; strategy: shared.tStrategy);

end;

procedure Init;
begin
    p.Name := name;
    p.Strategy := strategy;
    p.Score := 0;
end;

end.