let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "python3";
    buildInputs = [
      pkgs.direnv
      pkgs.python311Full
      pkgs.python311Packages.pip
      pkgs.python311Packages.virtualenv
    ];
    shellHook = ''
      export EDITOR=emacs
      export PS1="\\e[1;36m(shell) \u@\h:\W > \\e[0m"
      eval "$(direnv hook bash)"
      python -m venv .venv
      source ./.venv/bin/activate
      echo "Welcome to nix-shell for Python3!"
    '';
  }
