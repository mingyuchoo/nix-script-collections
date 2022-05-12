# 11-dev-wsl2

## Prerequisite

```bash
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

## Install flakes

Edit either `~/.config/nix/nix.conf` or `/etc/nix/nix.conf` and add:

```bash
experimental-features = nix-command flakes
```

## How to run

```bash
nix develop
exit
nix develop # again
```
### How to run automatically when you login your linux account

Edit `~/.profile` file

```bash
...

# on the bottom line
nix develop $CURRENT-GITHUB-REPOSITORY-PATH
```

## Nix REPL(Real-Eval-Print-Loop)

### How to search Nix packages using Nix REPL

```bash
nix repl '<nixpkgs>'

Welcome to Nix 2.8.0. Type :? for help.

Loading '<nixpkgs>'...
Added 16381 variables.

nix-repl> pkgs.<<TAB KEY>>

...
```
