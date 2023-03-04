let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "java";
    buildInputs = [
      pkgs.coursier
      pkgs.direnv
      pkgs.gradle
      pkgs.jdk17
      pkgs.sbt
    ];
    shellHook = ''
      export EDITOR=emacs
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for Java!"
    '';
  }
