{
  description = "A very basic flake";
  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs"; };
  };
  outputs = {self, nixpkgs, ... }: {
    # Executed by `nix flake check`
    #checks."<system>"."<name>" = derivation;

    # Executed by `nix build .#<name>`
    #packages."<system>"."<name>" = derivation;
    packages = builtins.mapAttrs
      (system: package: { hello = package.hello; })
      nixpkgs.legacyPackages;

    # Executed by `nix build .`
    #packages."<system>".default = derivation;
    #defaultPackage."<system>" = derivation;

    defaultPackage = builtins.mapAttrs
      (system: package: package.hello)
      self.packages;

    # Executed by `nix run .#<name>`
    #apps."<system>"."<name>" = {
    #  type = "app";
    #  program = "<store-path>";
    #};

    # Executed by `nix run . -- <args?>`
    #apps."<system>".default = { type = "app"; program = "..."; };
    #defaultApp."<system>" = { type = "app"; program = "..."; };
    defaultApp = builtins.mapAttrs
      (system: package: { type = "hello"; program = "${package}/bin/hello"; })
      self.defaultPackage;

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
