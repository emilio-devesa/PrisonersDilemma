{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
}
program Main;

import  StandardInput; StandardOutput;
        shared qualified;
        utils qualified;
        player qualified;
        strategies qualified;
        game qualified;

var     Alice, Bob: player.tPlayer;

procedure ShowHeader;
begin
    writeln;
    writeln('-------------------------');
    writeln('  PRISONERS'' DILEMMA ');
    writeln('-------------------------');
end;

function PromptStrategy(playerName: string): shared.tStrategy;
var input: string(255); option: integer; ok: boolean;
begin
    PromptStrategy := shared.AlwaysCooperate;  { Default value to avoid compiler warning }
    repeat
        writeln;
        writeln('Select strategy for ', playerName, ':');
        writeln('  1. Always Cooperate');
        writeln('  2. Always Defect');
        writeln;
        write('Strategy? (1-2): ');
        readln(input);
        option := utils.StringToInteger(input, ok);
        if ok and_then (option in [1..2]) then
        begin
            case option of
                1: PromptStrategy := shared.AlwaysCooperate;
                2: PromptStrategy := shared.AlwaysDefect;
            end;
        end
        else writeln('Invalid option');
    until option in [1..5];
end;

function PromptRounds: integer;
var input: string(255); option: integer; ok: boolean;
begin
    PromptRounds := 0;
    repeat
        write('Enter number of rounds (1..', shared.MAX_ROUNDS:0, '): ');
        readln(input);
        option := utils.StringToInteger(input, ok);
        if ok and_then (option in [1..shared.MAX_ROUNDS])
        then PromptRounds := option
        else writeln('Invalid number of rounds');
    until option in [1..shared.MAX_ROUNDS];
end;

procedure SetupPlayers;
var strat1, strat2: shared.tStrategy;
begin
    strat1 := PromptStrategy('Alice');
    player.Init(Alice, 'Alice', strat1);
    strat2 := PromptStrategy('Bob');
    player.Init(Bob, 'Bob', strat2);
end;

procedure RunRounds(r: integer);
var i: integer;
begin
    for i := 1 to r do game.PlayRound(Alice, Bob, i);
end;

procedure ShowResults(rounds: integer);
var historyStr: string(255);
begin
    writeln(Alice.Name, ' scored: ', Alice.Score:0);
    writeln(Bob.Name, ' scored: ', Bob.Score:0);
    writeln;
    player.HistoryToString(Alice, rounds, historyStr);
    writeln(Alice.Name, ': ', shared.TAB, historyStr);
    player.HistoryToString(Bob, rounds, historyStr);
    writeln(Bob.Name, ': ', shared.TAB, historyStr);
end;

function mainMenu: integer;
var input: string (255) value ''; option: integer value 0; ok: boolean value false;
begin
    mainMenu := 0;
    repeat
        writeln;
        writeln('-------------------------');
        writeln('  Main Menu');
        writeln('-------------------------');
        writeln ('1. Play Game');
        writeln ('2. Play Tournament');
        writeln ('0. Exit');
        writeln;
        write('Option?: ');
        readln(input);
        option := utils.StringToInteger(input, ok);
        if ok and_then (option in [0 .. 2])
        then mainMenu := option
        else writeln('Invalid option');        
    until option in [0 .. 2];
end;

function start(option: integer): integer;
var rounds: integer;
begin
    case (option) of
        1:  begin   { Play Game }
                SetupPlayers;
                writeln;
                rounds := PromptRounds;
                RunRounds(rounds);
                ShowResults(rounds);
                utils.WaitForEnter;
            end;
        2:  ;       { Play Tournament - To be implemented }
        0:  ;       { Exit }
    end;
    start := option;
end;

begin
    repeat
        utils.ClearScreen;
        ShowHeader;
    until (start(mainMenu) = 0);
end.