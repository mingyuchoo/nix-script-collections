{
  description = "";
  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };
  outputs = {self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
          rec {
            devShell = nixpkgs.legacyPackages.${system}.mkShell {
              buildInputs = [ nixpkgs.legacyPackages.${system}.ripgrep ];
              shellHook = ''
                echo "shell with ripgrep"
              '';
            };
          }
        );
}
