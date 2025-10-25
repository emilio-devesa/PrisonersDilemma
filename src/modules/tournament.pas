{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    tournament.pas
    Provides round-robin tournament procedure and results table printing
}
module tournament;

export  tournament = (
            RunTournament,
            PrintTournamentTable
);

import  StandardOutput;
        utils qualified;
        shared qualified;
        player qualified;
        strategies qualified;
        game qualified;

type    tTournamentResults = array [1 .. 9, 1 .. 9] of integer;
        tStrategyNames = array [1 .. 9] of string(20) value [1:'Coop'; 2:'Defe'; 3:'Frid'; 4:'Joss'; 5:'Pavl'; 6: 'Rand'; 7: 'TfT '; 8:'TfTT'; 9:'GTfT'];

procedure RunTournament(rounds: integer);
procedure PrintTournamentTable(var results: tTournamentResults);

end;

procedure RunTournament;
var s1, s2: shared.tStrategy; p1, p2: player.tPlayer; i: integer;
    results: tTournamentResults; names: tStrategyNames;
begin
    writeln('Running Tournament with ', rounds:0, ' rounds per match...');
    for s1 := shared.AlwaysCooperate to shared.GenerousTitForTat do begin
        for s2 := shared.AlwaysCooperate to shared.GenerousTitForTat do begin
            player.Init(p1, 'P1', s1);
            player.Init(p2, 'P2', s2);
            for i := 1 to rounds do game.PlayRound(p1, p2, i);
            results[ord(s1)+1, ord(s2)+1] := p1.Score;
            writeln('Match: ', names[ord(s1)+1], ' vs ', names[ord(s2)+1],'  ', p1.Score:2, ' - ', p2.Score:2);
        end;
    end;
    writeln('Tournament completed.');
    PrintTournamentTable(results);
end;

procedure PrintTournamentTable;
var i, j: integer; names: tStrategyNames;
begin
    writeln;
    writeln('-------------------------');
    writeln('Tournament Results Table:');
    writeln('-------------------------');
    write(shared.TAB);
    for i := 1 to 9 do write(names[i], shared.TAB);
    writeln;
    for i := 1 to 9 do begin
        write(names[i]:4, shared.TAB);
        for j := 1 to 9 do write(results[i,j]:3, shared.TAB);
        writeln;
    end;
    writeln;
end;


end.