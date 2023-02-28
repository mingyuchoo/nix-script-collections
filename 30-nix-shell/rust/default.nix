let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "rust";
    buildInputs = [
      pkgs.direnv
      pkgs.clippy
      pkgs.gcc
      pkgs.cargo
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
