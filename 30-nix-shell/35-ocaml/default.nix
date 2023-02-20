let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "ocaml";
    buildInputs = [
      pkgs.ocaml-ng.ocamlPackages_latest.ocaml
      pkgs.ocaml-ng.ocamlPackages_latest.findlib
      pkgs.ocaml-ng.ocamlPackages_latest.dune_3
      pkgs.ocaml-ng.ocamlPackages_latest.ocamlgraph
    ];
    shellHook = ''
      echo "Welcome to nix-shell for OCaml!"
    '';
  }
