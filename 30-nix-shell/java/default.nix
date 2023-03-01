let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "java";
    buildInputs = [
<<<<<<< HEAD:30-nix-shell/37-java/default.nix
      pkgs.coursier
=======
      pkgs.direnv
      pkgs.jdk17
>>>>>>> 285be150383f83f43e9910d12601eb2c72aac89b:30-nix-shell/java/default.nix
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
