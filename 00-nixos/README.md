# README

## References

- <https://nixos.wiki/wiki/Overview_of_the_NixOS_Linux_distribution>

## Declarative Configration

- `/etc/nixos/configuration.nix`
- `/etc/nixos/hardware-configuration.nix`

## How to rebuild

```bash
$ sudo nixos-rebuild switch
$ sudo nixos-rebuild test
$ sudo nixos-rebuild boot
```
## How to update every packages

```bash
$ sudo nix-channel --update            # check and set the lastest channel
$ sudo nixos-rebuild switch --upgrade  # Upgrade packages with declarative/NixOS
$ nix-env -u '*'                       # Upgrade packages with Ad-hoc
$ home-manager switch                  # Upgrade packages with Home Manager
```
### Cleaning the nix store

```bash
# for root
$ sudo nix-env --list-generations
$ sudo nix-env --delete-generations old
$ sudo nix-collect-garbage -d
$ sudo nix-store --gc

# for current user
$ nix-env --list-generations
$ nix-env --delete-generations old
$ nix-collect-garbage -d
$ nix-store --gc
```
