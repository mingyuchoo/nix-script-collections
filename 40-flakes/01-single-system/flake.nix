{
  description = "";
  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs"; };
  };
  outputs = {self, nixpkgs, ... }: {
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
    devShell = {
      x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.mkShell {
        buildInputs = [ nixpkgs.legacyPackages.x86_64-linux.ripgrep ];
        shellHook = ''
          echo "shell with ripgrep"
        '';
      };
    };
  };
}
