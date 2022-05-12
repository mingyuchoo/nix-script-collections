# 20-dev-macos

## Prerequisite

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

## How to run

```bash
nix-shell

# or

nix-shell default.nix
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
