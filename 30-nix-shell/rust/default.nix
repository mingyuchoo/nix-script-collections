let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "rust";
    buildInputs = [
      pkgs.cargo
      pkgs.cargo-watch
      pkgs.cargo-modules
      pkgs.cargo-lambda
      pkgs.clippy
      pkgs.direnv
      pkgs.gcc
      pkgs.rustc
      pkgs.rustfmt
      pkgs.rustup
    ];
    shellHook = ''
      export EDITOR=emacs
      eval "$(direnv hook bash)"
      echo Welcome to nix-shell for Rust!
    '';
  }
