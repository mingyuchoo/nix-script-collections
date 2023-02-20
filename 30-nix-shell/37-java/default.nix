let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "java";
    buildInputs = [
      pkgs.jdk17
      pkgs.gradle
    ];
    shellHook = ''
      echo "Welcome to nix-shell for Java!"
    '';
  }
