# 30-dev-nodejs

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
nix-shell

# or

nix-shell default.nix
```
