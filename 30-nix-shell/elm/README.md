# nix-shell for Elm

## Prerequisite

```bash
# Multi-user installation
sh <(curl -L https://nixos.org/nix/install) --daemon

# Single-user installation
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

### Install flakes (optional)

Edit `/etc/nix/nix.conf` if you installed Nix as `Multi-user` or
create and edit `~/.config/nix/nix.conf` if you installed Nix as `Single-user`

and add:

```bash
experimental-features = nix-command flakes
```

## How to enter to nix-shell

```bash
nix-shell

# or

nix-shell default.nix
```

## How to use `direnv`

Create `.envrc` file for `direnv`

```bash
cd <some-project-name>
touch .envrc
```

Edit `.envrc` like this.
This shell script prevents infinitely recursive execution of commands.

```bash
export IS_IN_NIX_SHELL=1

if [ -z $IS_IN_NIX_SHELL ]; then
  # some command to execute here
  # ex) cargo watch -x check -x test
fi
```