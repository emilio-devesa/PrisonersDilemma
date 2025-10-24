{   Prisoners' Dilemma
    Command Line program written in Pascal ISO 10206 (Extended Pascal)
    More info: README.md
    
    shared.pas
    Provides common definitions and payoff calculation
}
module shared;

export  shared = (
            TAB,
            MAX_ROUNDS,
            tAction,
            Cooperate,
            Defect,
            tStrategy,
            AlwaysCooperate,
            AlwaysDefect,
            Friedman,
            Joss,
            Pavlov,
            Random,
            TitForTat,
            TitForTwoTats,
            GenerousTitForTat,
            GetPayoff
);

const   TAB = chr(9);
        MAX_ROUNDS = 100;
        PAYOFF_CC = 3;
        PAYOFF_CD = 0;
        PAYOFF_DC = 5;
        PAYOFF_DD = 1;

type    tAction = (Cooperate, Defect);
        tStrategy = (AlwaysCooperate, AlwaysDefect, Friedman, Joss, Pavlov, Random, TitForTat, TitForTwoTats, GenerousTitForTat);

procedure GetPayoff(A1, A2: tAction; var P1Points, P2Points: integer);

end;

procedure GetPayoff;
begin
    case A1 of
        Cooperate:  
            case A2 of
                Cooperate:  begin P1Points := PAYOFF_CC; P2Points := PAYOFF_CC; end;
                Defect:     begin P1Points := PAYOFF_CD; P2Points := PAYOFF_DC; end;
            end;
        Defect:
            case A2 of
                Cooperate:  begin P1Points := PAYOFF_DC; P2Points := PAYOFF_CD; end;
                Defect:     begin P1Points := PAYOFF_DD; P2Points := PAYOFF_DD; end;
            end;
    end;
end;

end.