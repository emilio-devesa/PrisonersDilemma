# Prisoners' Dilemma

Small command-line simulation of iterated Prisoners' Dilemma written in Extended Pascal (ISO 10206).


## Structure
- `src/` - source files
    - `Main.pas` - program entry and CLI
        - `modules/shared.pas` - shared types and payoff function; supports configurable payoff matrix using constants `Payoff_CC`, `Payoff_CD`, `Payoff_DC`, `Payoff_DD`.
        - `modules/player.pas` - player data and initialization
        - `modules/strategies.pas` - strategy implementations (AlwaysCooperate, AlwaysDefect)
        - `modules/game.pas` - round execution, score accounting.
        - `modules/utils.pas` - small helpers (string parsing, clear screen)

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
