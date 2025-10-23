{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    utils.pas
    Provides common procedures and functions
}
module utils;

export  utils = (
            ClearScreen,
            WaitForEnter,
            StringToInteger
);

import  StandardInput;
        StandardOutput;

procedure ClearScreen;
procedure WaitForEnter;
function StringToInteger(input: string; var ok: boolean): integer;

end;

{ Clears screen using ANSI escape code }
procedure ClearScreen;
begin
    write(chr(27)+'[2J');  (* Clear screen *)
    write(chr(27)+'[H');   (* Move cursor to top-left *)
end;

procedure WaitForEnter;
begin
    writeln;
    write('Press ENTER to continue...');
    readln;
end;

function StringToInteger;
var i, sign, val: integer; ch: char;
begin
    val := 0;
    sign := 1;
    ok := false;
    StringToInteger := -1;
    i := 1;
    { Check sign }
    if (length(input) > 0) then if (input[i] = '-') then
    begin
        sign := -1;
        i := i + 1;
    end
    else if input[i] = '+' then
        i := i + 1;
    { Parse characters and calculate the number }
    while i <= length(input) do
    begin
        ch := input[i];
        val := val * 10 + (ord(ch) - ord('0'));
        i := i + 1;
    end;
    if (length(input) > 0) then begin
        StringToInteger := sign * val;
        ok := true;
    end;
end;

end.