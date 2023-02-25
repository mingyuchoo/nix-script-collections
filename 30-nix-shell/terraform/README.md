# nix-shell for Terraform

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

## Try an example configuration for Terraform

```bash
$ terraform login
$ git clone https://github.com/hashicorp/tfc-getting-started.git
$ cd tfc-getting-started
$ ./scripts/setup.sh
```


## References

- <https://app.terraform.io/app/getting-started/example>
