let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "go";
    buildInputs = [
      pkgs.direnv
      pkgs.gcc
      pkgs.glibc.static
      pkgs.go_1_20
      pkgs.libcap
    ];
    shellHook = ''
      export EDITOR=emacs
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for Go!"
    '';
  }
