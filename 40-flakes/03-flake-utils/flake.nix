{
  description = "";
  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };
  outputs = {self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
          rec {
            #overlay = (final: prev: {});

            # executed by `nix run .#name`
            #defaultApp = {};

            # executed by `nix run`
            #apps = {};

            # executed by `nix build`
            #defaultPackage = {};

            # executed by `nix build .#name`
            #packages = {};

            # executed by `nix develop .#name`
            #devShells = {};

            # executed by `nix develop`
            devShell = nixpkgs.legacyPackages.${system}.mkShell {
              buildInputs = [ nixpkgs.legacyPackages.${system}.ripgrep ];
              shellHook = ''
                echo "shell with ripgrep"
              '';
            };
          }
        );
}
