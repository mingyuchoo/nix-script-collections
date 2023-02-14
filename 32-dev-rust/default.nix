let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "rust";
    buildInputs = [
      pkgs.rustc
      pkgs.rustup
      pkgs.cargo
    ];
    shellHook = ''
      Welcome to nix-shell for Rust!
    '';
  }
