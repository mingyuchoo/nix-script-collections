# README

## References

- <https://nixos.wiki/wiki/Overview_of_the_NixOS_Linux_distribution>

## Declarative Configration

- `/etc/nixos/configuration.nix`
- `/etc/nixos/hardware-configuration.nix`

## How to rebuild

```bash
nixos-rebuild switch
nixos-rebuild test
nixos-rebuild boot
```
## How to update very packages

```bash
sudo nix-channel --update            # check and set the lastest channel
sudo nixos-rebuild switch --upgrade  # Upgrade packages with declarative/NixOS
nix-env -u '*'                       # Upgrade packages with Ad-hoc
home-manager switch                  # Upgrade packages with Home Manager
```
