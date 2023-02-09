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
      #overlay = (final: prev: {});

      # executed by `nix run .#name`
      #defaultApp = forAllSystems (system: {});

      # executed by `nix run`
      #apps = forAllSystems (system: {});

      # executed by `nix build`
      #defaultPackage = forAllSystems (system: {});

      # executed by `nix build .#name`
      #packages = forAllSystems (system: {});

      # executed by `nix develop .#name`
      #devShells = forAllSystems (system: {});

      # executed by `nix develop`
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
