let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "c/c++";
    buildInputs = [
      pkgs.gcc
      pkgs.cmake
      pkgs.glibc
      pkgs.glibc.static
    ];
    shellHook = ''
      echo "Welcome to nix-shell for C/C++!"
    '';
  }
