# Prisoners' Dilemma

Small command-line simulation of iterated Prisoners' Dilemma written in Extended Pascal (ISO 10206).

## Structure
- `src/` - source files
    - `Main.pas` - program entry and CLI
        - `modules/shared.pas` - shared types and payoff function; supports configurable payoff matrix using constants `Payoff_CC`, `Payoff_CD`, `Payoff_DC`, `Payoff_DD`.
        - `modules/player.pas` - player data, initialization and history
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
        - `modules/game.pas` - round execution, score accounting.
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

## Notes
- `Random` strategy uses a simple LCG; results involving Random are stochastic and therefore not asserted in the test suite.
- The project is intentionally small and modular; strategies are implemented under `modules/strategies/` and may be extended easily.

## Extending
- To add a new strategy, update the `tStrategy` enum in `shared.pas`, add its selection in `strategies.pas`.

## Contributing
See `CONTRIBUTING.md` for guidelines.