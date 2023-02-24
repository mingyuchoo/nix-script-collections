# 32-python3

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

## How to create python project

```bash
$ nix-shell
$ mkdir <project-name>
$ cd <project-name>
$ python -m venv venv
$ source ./venv/bin/activate
$ python -m pip install behave
$ python -m pip install coverage
$ python -m pip install pydantic
$ pythom -m list
$ python -m pip freeze > requirements.txt
```