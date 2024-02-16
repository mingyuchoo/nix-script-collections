# README

## Prerequisite

```bash
# Multi-user installation
sh <(curl -L https://nixos.org/nix/install) --daemon

# Single-user installation
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

## How to create Rust project



```bash
$ cargo new <project-name>
$ cd <project-name>
$ cargo fetch   # This command populate the `Carogo.lock` file
$ git add Cargo.lock
$ cargo check
$ cargo build --release
$ cargo run --release
```

## How to create `flake.nix` file

Please reference below links

- <https://hoverbear.org/blog/a-flake-for-your-crate/>
- <https://dev.to/misterio/how-to-package-a-rust-app-using-nix-3lh3>

## Build & Run with Nix flake

```bash
$ git add .
$ nix build
$ nix run
```

### Install flakes

Edit `/etc/nix/nix.conf` if you installed Nix as `Multi-user` or
create and edit `~/.config/nix/nix.conf` if you installed Nix as `Single-user`

and add:

```bash
experimental-features = nix-command flakes
```

### How use Nix flakes

```bash
$ nix flake check --all-systems
$ nix flake show
$ nix run              # run flake.nix script
$ nix develop          # enter to nix environment
```

### How to use `direnv`

Create `.envrc` file for `direnv`

```bash
$ cd <some-project-name>
$ touch .envrc
```

Edit `.envrc` like this.
This shell script prevents infinitely recursive execution of commands.

```bash
if [[ -z "$IS_IN_NIX_SHELL" ]] ; then
   export IS_IN_NIX_SHELL=1
   # add some command to execute here
   source ./.venv/bin/activate
fi
```

## References

- <https://www.tweag.io/blog/2020-05-25-flakes/>
