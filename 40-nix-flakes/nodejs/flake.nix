{
  description = "A basic devShell using flake-utils for Nodejs";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
        rec {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              direnv
              nodejs-18_x
              yarn
            ];
            shellHook = ''
              export PATH="$PWD/node_modules/.bin:$PATH"
              export LANG=C.UTF-8
              export EDITOR=emacs
              export PS1="\\e[1;34mdevelop > \\e[0m"
              eval "$(direnv hook bash)"
              echo "Welcome to nix flake for Nodejs"
            '';
          };
        }
    );
}
