# README

## Prerequisite

```bash
# Multi-user installation
sh <(curl -L https://nixos.org/nix/install) --daemon

# Single-user installation
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

## Install flakes

Edit `/etc/nix/nix.conf` if you installed Nix as `Multi-user` or
create and edit `~/.config/nix/nix.conf` if you installed Nix as `Single-user`

and add:

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
nix repl --expr 'import <nixpkgs>{}'

Welcome to Nix 2.8.0. Type :? for help.

Loading '<nixpkgs>'...
Added 16381 variables.

nix-repl> pkgs.<<TAB KEY>>

...
```

# README

-<https://gist.github.com/adisbladis/187204cb772800489ee3dac4acdd9947>
