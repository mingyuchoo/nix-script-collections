let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "ada";
    buildInputs = [
      pkgs.alire
      pkgs.gnat
      pkgs.gprbuild
    ];
    shellHook = ''
      export EDITOR=emacs
      export PS1="\\e[1;36m(shell) \u@\h:\W > \\e[0m"
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for Ada!"
    '';
  }
