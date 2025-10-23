{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    game.pas
    Provides game round procedure
}
module game;

export  game = (
            PlayRound
);

import  shared qualified; 
        player qualified;
        strategies qualified;

procedure PlayRound(var p1, p2: player.tPlayer; round: integer);

end;

procedure PlayRound;
var A1, A2: shared.tAction; P1Points, P2Points: integer;
begin
    A1 := strategies.DecideAction(p1);
    A2 := strategies.DecideAction(p2);
    shared.GetPayoff(A1, A2, P1Points, P2Points);
    p1.Score := p1.Score + P1Points;
    p2.Score := p2.Score + P2Points;
    p1.History[round] := A1;
    p2.History[round] := A2;
end;

end.