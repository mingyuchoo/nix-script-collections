let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "java";
    buildInputs = [
      pkgs.coursier
      pkgs.gradle
      pkgs.jdk17
      pkgs.sbt
    ];
    shellHook = ''
      echo "Welcome to nix-shell for Java!"
    '';
  }
