# DOS MMRCC

DOS MMRCC is a customized CDU DOS 7.1 release for the Mid-Michigan Retro
Computer Club.  It is tuned for retro LAN-party machines: English-language
bug fixes, performance-focused DOS configuration, automated install/update
menus, curated drivers and utilities, and an install sequence for
IPX-compatible DOS games.

The goal is to make a repeatable DOS environment that is fast to deploy,
consistent across club machines, and still understandable enough for other
retro computing groups to adapt.

## What This Repo Contains

- Boot-menu and installer source files under `boot/`.
- Helper scripts under `Scripts/`.
- Build and release notes in `BUILD.TXT`.
- Release history in `HISTORY.TXT`.

Large payloads and generated outputs are kept out of Git:

- `VAULT/` contains pristine upstream game and utility source data.
- `SOURCE/` contains curated versioned release source data.
- `STAGING/` contains compiled ISO-root trees ready for mastering.
- `ISO/` contains finished ISO images.

See `BUILD.TXT` for the full source-to-ISO workflow.

## Project Scope

This repository is primarily the public build logic and documentation for the
MMRCC DOS release.  The scripts are made available so others can study,
reuse, or adapt the install process for their own legally obtained DOS,
driver, utility, and game payloads.

The generated release media is intended for machines used at Mid-Michigan
Retro Computer Club events, especially systems that need a predictable DOS
environment for IPX networking and period-correct multiplayer games.

