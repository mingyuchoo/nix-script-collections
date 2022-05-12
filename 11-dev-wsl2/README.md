# 01-linux-env

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
