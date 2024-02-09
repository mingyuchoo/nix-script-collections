{
 description = "A very basic flake";
  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };
  outputs = {self, nixpkgs, flake-utils}:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        rec {
          # Executed by `nix flake check --all-systems`
          #checks."<system>"."<name>" = derivation;

          # Executed by `nix build .#<name>`
          #packages."<system>"."<name>" = derivation;

          # Executed by `nix build .`
          #packages."<system>".default = derivation;
          packages = {
            default = derivation {
              name = "my-derived-package";
              builder = "my-builder";
              system = "${system}";
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
            default = pkgs.mkShell {
              buildInputs = with pkgs; [
                # ADD PACKAGES HERE
              ];
              shellHook = ''
                  export LANG=C.UTF-8
                  export EDITOR=emacs
                  export PS1="\\e[1;36m(develop) \u@\h:\W > \\e[0m"
                  eval "$(direnv hook bash)"
                  echo "Welcome to Nix flake"
              '';
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
        }
    );
}
