{
  description = "";
  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs"; };
  };
  outputs = {self, nixpkgs, ... }: {
    # Executed by `nix flake check`
    #checks."<system>"."<name>" = derivation;

    # Executed by `nix build .#<name>`
    #packages."<system>"."<name>" = derivation;

    # Executed by `nix build .`
    #packages."<system>".default = derivation;
    packages = {
      x86_64-linux = {
        default = derivation {
            name = "my-name";
            builder = "my-builder";
            system = "x86_64-linux";
          };
      };
    };

    # Executed by `nix run .#<name>`
    #apps."<system>"."<name>" = {
    #  type = "app";
    #  program = "<store-path>";
    #};

    # Executed by `nix run . -- <args?>`
    #apps."<system>".default = { type = "app"; program = "..."; };

    # Formatter (alejandra, nixfmt or nixpkgs-fmt)
    #formatter."<system>" = derivation;

    # Used for nixpkgs packages, also accessible via `nix build .#<name>`
    #legacyPackages."<system>"."<name>" = derivation;

    # Overlay, consumed by other flakes
    #overlays."<name>" = final: prev: { };

    # Default overlay
    #overlays.default = {};

    # Nixos module, consumed by other flakes
    #nixosModules."<name>" = { config }: { options = {}; config = {}; };

    # Default module
    #nixosModules.default = {};

    # Used with `nixos-rebuild --flake .#<hostname>`
    # nixosConfigurations."<hostname>".config.system.build.toplevel must be a derivation
    #nixosConfigurations."<hostname>" = {};

    # Used by `nix develop .#<name>`
    #devShells."<system>"."<name>" = derivation;

    # Used by `nix develop`
    #devShells."<system>".default = derivation;
    devShells = {
      x86_64-linux = {
        default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
          buildInputs = [ nixpkgs.legacyPackages.x86_64-linux.ripgrep ];
          shellHook = ''
            echo "shell with ripgrep"
          '';
        };
      };
    };

    # Hydra build jobs
    #hydraJobs."<attr>"."<system>" = derivation;

    # Used by `nix flake init -t <flake>#<name>`
    #templates."<name>" = {
    #  path = "<store-path>";
    #  description = "template description goes here?";
    #};

    # Used by `nix flake init -t <flake>`
    #templates.default = { path = "<store-path>"; description = ""; };
  };
}