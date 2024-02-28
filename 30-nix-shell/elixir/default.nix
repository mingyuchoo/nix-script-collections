let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "exlixir";
    buildInputs = [
      pkgs.direnv
      pkgs.beam.packages.erlangR25.elixir_1_14
    ];
    shellHook = ''
      export EDITOR=emacs
      export PS1="\\e[1;36m(shell) \u@\h:\W > \\e[0m"
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for Elixir!"
    '';
  }
