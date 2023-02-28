let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "Elm";
    buildInputs = [
      pkgs.direnv
      pkgs.elmPackages.elm
      pkgs.elmPackages.elm-analyse
      pkgs.elmPackages.elm-doc-preview
      pkgs.elmPackages.elm-format
      pkgs.elmPackages.elm-language-server
      pkgs.elmPackages.elm-live
      pkgs.elmPackages.elm-test
    ];
    shellHook = ''
      export EDITOR=emacs
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for Elm!"
    '';
  }
