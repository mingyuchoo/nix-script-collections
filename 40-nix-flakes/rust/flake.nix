{
  description = "A basic devShell using flake-utils for Rust";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
        rec {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              cargo
              cargo-watch
              clippy
              direnv
              gcc
              rustc
              rustfmt
              rustup
            ];
            shellHook = ''
              export LANG=C.UTF-8
              export EDITOR=emacs
              export PS1="\\e[1;34m(develop) \u@\h:\W > \\e[0m"
              eval "$(direnv hook bash)"
              echo "Welcome to nix flake for Rust"
            '';
          };
        }
    );
}
