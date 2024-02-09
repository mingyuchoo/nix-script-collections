# README

## Prerequisite

```bash
# Multi-user installation
sh <(curl -L https://nixos.org/nix/install) --daemon

# Single-user installation
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

### Install flakes

Edit `/etc/nix/nix.conf` if you installed Nix as `Multi-user` or
create and edit `~/.config/nix/nix.conf` if you installed Nix as `Single-user`

and add:

```bash
experimental-features = nix-command flakes
```

## How use Nix flakes

```bash
nix flake check --all-systems
nix flake show
nix run              # run flake.nix script
nix develop          # enter to nix environment
```
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


## How to use `direnv`

Create `.envrc` file for `direnv`

```bash
cd <some-project-name>
touch .envrc
```

Edit `.envrc` like this.
This shell script prevents infinitely recursive execution of commands.

```bash
if [[ -z "$IS_IN_NIX_SHELL" ]] ; then
   export IS_IN_NIX_SHELL=1
   # add some command to execute here
   source ./venv/bin/activate
fi
```
