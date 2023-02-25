let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "terraform";
    buildInputs = [
      pkgs.terraform
    ];
    shellHook = ''
      export EDITOR=emacs
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for Terraform!"
    '';
  }
