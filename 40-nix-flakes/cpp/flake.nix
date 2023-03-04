{
  description = "A basic devShell using flake-utils for C/C++";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
        rec {
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              direnv
              gcc
              cmake
              glibc
              glibc.static
            ];
            shellHook = ''
              export EDITOR=emacs
              eval "$(direnv hook bash)"
              echo "Welcome to nix flake for C/C++"
            '';
          };
        }
    );
}
