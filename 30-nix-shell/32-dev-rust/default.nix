let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "rust";
    buildInputs = [
      pkgs.clippy
      pkgs.gcc
      pkgs.cargo
      pkgs.rustc
      pkgs.rustfmt
      pkgs.rustup
    ];
    shellHook = ''
      echo Welcome to nix-shell for Rust!
    '';
  }
