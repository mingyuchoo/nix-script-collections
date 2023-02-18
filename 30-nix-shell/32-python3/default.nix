let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "python3";
    buildInputs = [
      pkgs.python311Full
      pkgs.python311Packages.pip
      pkgs.python311Packages.virtualenv
    ];
    shellHook = ''
      echo "Welcome to nix-shell for Python3!"
    '';
  }
