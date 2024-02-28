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
      pkgs.scala_3
    ];
    shellHook = ''
      export EDITOR=emacs
      export PS1="\\e[1;36m(shell) \u@\h:\W > \\e[0m"
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for Scala!"
    '';
  }
