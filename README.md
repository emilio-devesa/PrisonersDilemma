# Prisoners' Dilemma

Small command-line simulation of iterated Prisoners' Dilemma written in Extended Pascal (ISO 10206).

Inspired after [Veritasium's video](https://www.youtube.com/watch?v=mScpHTIi-kM) about the most famous problem in Game Theory, the Prisoner’s Dilemma, and Prof. Robert Axelrod works.

## Structure
- `src/` - source files
    - `Main.pas` - program entry and CLI
        - `modules/game.pas` - round execution, score accounting.
        - `modules/player.pas` - player data, initialization and history
        - `modules/shared.pas` - shared types and payoff function; supports configurable payoff matrix using constants `Payoff_CC`, `Payoff_CD`, `Payoff_DC`, `Payoff_DD`.
        - `modules/strategies.pas` - strategy selection (AlwaysCooperate, AlwaysDefect, etc.)
        - `modules/strategies/`
            - `modules/strategies/alwayscooperate.pas` - Implementation of AlwaysCooperate strategy
            - `modules/strategies/alwaysdefect.pas` - Implementation of AlwaysDefect strategy
            - `modules/strategies/friedman.pas` - Implementation of Friedman (grim trigger) strategy
            - `modules/strategies/generoustitfortat.pas` - Implementation of Generous Tit For Tat (forgives a defection with 10% probability) strategy
            - `modules/strategies/joss.pas` - Implementation of Joss (Like Tit For Tat but with 10% proability of defection after cooperation) strategy
            - `modules/strategies/pavlov.pas` - Implementation of Pavlov (Win-Stay, Loose-Shift) strategy
            - `modules/strategies/random.pas` - Implementation of Random strategy
            - `modules/strategies/titfortat.pas` - Implementation of Tit For Tat (Copy opponent's previous action) strategy
            - `modules/strategies/titfortwotats.pas` - Implementation of Tit For Two Tats (Cooperate and only defect after two defections) strategy
        - `modules/tournament.pas`- round-robin tournament execution and results printing
        - `modules/utils.pas` - small helpers (string parsing, clear screen, random integer generation)

## Compilation
Uses GNU Pascal compiler:

	$ make all

Clean files:

	$ make clean

## Usage
Execute:

	$ bin/Main

## Features
- Configure number of rounds at startup (capped to `MAX_ROUNDS` constant value in `shared.pas`).
- Configure the payoff matrix using constants `PAYOFF_CC`, `PAYOFF_CD`, `PAYOFF_DC` and `PAYOFF_DD` in `shared.pas` if you need a different game variant.
- Print per-player history (C/D) after the match.
- **Tournament mode**: Run a round-robin tournament between all strategies. The program simulates all pairings and prints a results table showing the score of each strategy against every other.

### Example: Tournament Table
```
-------------------------
Tournament Results Table:
-------------------------
        Coop    Defe    Frid    Joss    Pavl    Rand    TfT     TfTT    GTfT
Coop     30       0      30      27      30      12      30      30      30
Defe     50      10      14      14      14      30      14      18      18
Frid     30       9      30      17      30      25      30      30      30
Joss     34       9      19      25      29      26      27      32      31
Pavl     30       9      30      28      30      22      30      30      30
Rand     40       7      10      23      26      18      23      36      29
TfT      30       9      30      20      30      24      30      30      30
TfTT     30       8      30      27      30      16      30      30      30
GTfT     30       7      30      26      30      20      30      30      30
```
Each cell shows the score obtained by the row strategy against the column strategy (for the configured number of rounds).

## Notes
- `Random` strategy uses a simple LCG; results involving Random are stochastic and therefore not asserted in the test suite.
- The project is intentionally small and modular; strategies are implemented under `modules/strategies/` and may be extended easily.

## Extending
- To add a new strategy, update the `tStrategy` enum in `shared.pas`, add its selection in `strategies.pas`, and add its name to the strategy names array in the tournament code.

## Contributing
See `CONTRIBUTING.md` for guidelines.