let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "Elm";
    buildInputs = [
      pkgs.elmPackages.elm
      pkgs.elmPackages.elm-analyse
      pkgs.elmPackages.elm-doc-preview
      pkgs.elmPackages.elm-format
      pkgs.elmPackages.elm-language-server
      pkgs.elmPackages.elm-live
      pkgs.elmPackages.elm-test
    ];
    shellHook = ''
      echo "Welcome to nix-shell for Elm!"
    '';
  }
