{
  description = "A basic devShell using flake-utils for Python3";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
        rec {
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              direnv
              python311Full
              python311Packages.pip
              python311Packages.virtualenv
            ];
            shellHook = ''
              export EDITOR=emacs
              eval "$(direnv hook bash)"
              echo "Welcome to nix flake for Python3"
            '';
          };
        }
    );
}
