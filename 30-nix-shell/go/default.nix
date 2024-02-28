let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "go";
    buildInputs = [
      pkgs.direnv
      pkgs.clang
      pkgs.go_1_21
      pkgs.libcap
    ];
    shellHook = ''
      export EDITOR=emacs
      export PS1="\\e[1;36m(shell) \u@\h:\W > \\e[0m"
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for Go!"
    '';
  }
