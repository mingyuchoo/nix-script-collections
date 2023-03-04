let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "ocaml";
    buildInputs = [
      pkgs.direnv
      pkgs.ocaml-ng.ocamlPackages_latest.ocaml
      pkgs.ocaml-ng.ocamlPackages_latest.findlib
      pkgs.ocaml-ng.ocamlPackages_latest.dune_3
      pkgs.ocaml-ng.ocamlPackages_latest.ocamlgraph
    ];
    shellHook = ''
      export EDITOR=emacs
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for OCaml!"
    '';
  }