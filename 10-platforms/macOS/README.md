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

## How to use

```bash
nix develop

# README

export NIXPKGS_ALLOW_BROKEN=1
nix develop --impure
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
