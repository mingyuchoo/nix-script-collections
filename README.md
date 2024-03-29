<p align="center">
  <a href="https://github.com/mingyuchoo/nix-script-collections/blob/main/LICENSE"><img alt="license" src="https://img.shields.io/github/license/mingyuchoo/nix-script-collections"/></a>
  <a href="https://github.com/mingyuchoo/nix-script-collections/issues"><img alt="Issues" src="https://img.shields.io/github/issues/mingyuchoo/nix-script-collections?color=appveyor" /></a>
  <a href="https://github.com/mingyuchoo/nix-script-collections/pulls"><img alt="GitHub pull requests" src="https://img.shields.io/github/issues-pr/mingyuchoo/nix-script-collections?color=appveyor" /></a>
</p>

# README

## References

- <https://nixos.wiki/wiki/Overview_of_the_NixOS_Linux_distribution>

## Prerequisite

```bash
# Multi-user installation
sh <(curl -L https://nixos.org/nix/install) --daemon

# Single-user installation
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# Add a channel
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update
```

## Configuration NixOS

### Declarative Configration

- `/etc/nixos/configuration.nix`
- `/etc/nixos/hardware-configuration.nix`

### How to rebuild

```bash
nixos-rebuild switch
nixos-rebuild test
nixos-rebuild boot
```
### How to update every packages

```bash
sudo nix-channel --update            # check and set the lastest channel
sudo nixos-rebuild switch --upgrade  # Upgrade packages with declarative/NixOS
nix-env -u '*'                       # Upgrade packages with Ad-hoc
home-manager switch                  # Upgrade packages with Home Manager
```
#### Cleaning the nix store

```bash
sudo nix-store --gc
sudo nix-collect-garbage
```

#### Cleaning generations

```bash
sudo nix-env --profile /nix/var/nix/profiles/system --list-generations
sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old
```

## Install flakes

Edit `/etc/nix/nix.conf` if you installed Nix as `Multi-user` or
create and edit `~/.config/nix/nix.conf` if you installed Nix as `Single-user`

and add:

```bash
experimental-features = nix-command flakes
```

## Nix REPL(Real-Eval-Print-Loop)

### How to search Nix packages using Nix REPL

```bash
nix repl --expr 'import <nixpkgs>{};

Welcome to Nix 2.8.0. Type :? for help.

Loading '<nixpkgs>'...
Added 16381 variables.

nix-repl> pkgs.#TAB KEY

...

nix-repl> :q # EXIT
```

## Nix Language

### Values

#### Simple Values

* Strings
* Numbers
  * integers
  * floating point
  * Paths
  * Booleans
  * The null value

### Lists

```nix
[ v1 v2 v3 ... vn ]
```

```nix
# example
[ 123 ./foo.nix "abc" (f { x = y; }) ]
```

### Sets

```nix
{ name1 = value1;
  name2 = value2;
  ...
}
```

```nix
# example
{ x = 123;
  text = "Hello";
  y = f { bla = 456; };
}
```

### Recursive sets

```nix
# example
rec {
  x = y;
  y = 123;
}.x
```

### Let-expressions

```nix
let e1; in e2
```

```nix
# example
let x = "foo";
    y = "bar";
in x + y
```

### Inheriting attributes

```nix
# example
let x = 123 in
{ inherit x;
  y = 456;
}

# is equivalent to
let x = 123; in
{ x = x;
  y = 456;
}
```

### Functions

```nix
pattern: body
```

### Conditionals

```nix
if e1 then e2 else e3
```

### Assertions

```nix
assert e1; e2
```

### With-expressions

```nix
with e1; e2
```

### Comments

```nix
#
/* ... */
```
