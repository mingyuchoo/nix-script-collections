let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "dhall";
    buildInputs = [
      pkgs.gcc
      pkgs.cmake
      pkgs.glibc
      pkgs.glibc.static
    ];
    shellHook = ''
      export EDITOR=emacs
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for Dhall configuration language!"
    '';
  }
