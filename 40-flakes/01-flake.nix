{
  description = "";
  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };
  outputs = {self, nixpkgs, flake-utils, ... }: {
    #overlay = (final: prev: {});

    # executed by `nix run .#name`
    #defaultApp = forAllSystems (system: {});

    # executed by `nix run`
    #apps = forAllSystems (system: {});

    # executed by `nix build`
    #defaultPackage = forAllSystems (system: {});

    # executed by `nix build .#name`
    #packages = forAllSystems (system: {});

    # executed by `nix develop`
    #devShell = forAllSystems (system: {});
    devShell = {
      x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.mkShell {
        buildInputs = [ nixpkgs.legacyPackages.x86_64-linux.ripgrep ];
        shellHook = ''
          echo "shell with ripgrep"
        '';
      };
    };

    # executed by `nix develop .#name`
    #devShells = forAllSystems (system: {});
  };
}
