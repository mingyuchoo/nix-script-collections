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
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for Python3!"
    '';
  }
