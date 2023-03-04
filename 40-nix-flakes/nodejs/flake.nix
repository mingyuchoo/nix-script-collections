{
  description = "A basic devShell using flake-utils for Nodejs";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
        rec {
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              direnv
              nodejs-18_x
              yarn
            ];
            shellHook = ''
              export EDITOR=emacs
              export PATH="$PWD/node_modules/.bin:$PATH"
              eval "$(direnv hook bash)"
              echo "Welcome to nix flake for Nodejs"
            '';
          };
        }
    );
}
