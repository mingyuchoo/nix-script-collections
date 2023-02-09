{
  description = "";
  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs"; };
  };
  outputs = {self, nixpkgs, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];
    in {
      devShell = forAllSystems (system:
        nixpkgs.legacyPackages.${system}.mkShell {
          buildInputs = [ nixpkgs.legacyPackages.${system}.ripgrep ];
          shellHook = ''
            echo "shell with ripgrep"
          '';
        }
      );
    };
}
