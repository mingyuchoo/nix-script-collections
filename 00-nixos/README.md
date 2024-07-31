# README

## References

- <https://nixos.wiki/wiki/Overview_of_the_NixOS_Linux_distribution>

## Declarative Configration

- `/etc/nixos/configuration.nix`
- `/etc/nixos/hardware-configuration.nix`

## How to rebuild

```bash
sudo nixos-rebuild switch
sudo nixos-rebuild test
sudo nixos-rebuild boot
```

## How to update every packages

```bash
sudo nix-channel --update            # check and set the lastest channel
sudo nixos-rebuild switch --upgrade  # Upgrade packages with declarative/NixOS
nix-env -u '*'                       # Upgrade packages with Ad-hoc
```

### Cleaning the nix store

```bash
# for root
sudo nix-env --profile /nix/var/nix/profiles/system --list-generations
sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old
sudo nix-collect-garbage -d
sudo nix-store --gc

# for current user
nix-env --list-generations
nix-env --delete-generations old
nix-collect-garbage -d
nix-store --gc
```

## NixOS Home Manager

### Installing Home Manager

#### Option 1: NixOS

Configure `/etc/nixos/configuration.nix` file as below

```nix
environment.systemPackages = with pkg; [
  home-manager
];
```

Initialize $HOME for Home Manager as below

```bash
home-manager init
cd /.config/home-manager/
ls
flake.nix home.nix
```

#### Option 2: Standalone installation

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
nix-channel --update
reboot
nix-shell '<home-manager>' -A install
```

### Using Home Manager

#### Configuration

```bash
vi $HOME/.config/home-manager/home.nix
```

#### Build and activate

```bash
# short
home-manager switch

# full
home-manager switch --flake $HOME/.config/home-manager/#mgch
```

#### Rollbacks

```bash
home-manager generations
# copy the Nix store path
<copied-nix-store-path>/activate
```

### Updating

```bash
nix-channel --update
...
unpacking channels...
export NIXPKGS_ALLOW_UNFREE=1; home-manager switch
```
