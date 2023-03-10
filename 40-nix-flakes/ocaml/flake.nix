{
  description = "A basic devShell using flake-utils for OCaml";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
        rec {
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              direnv
              ocaml-ng.ocamlPackages_latest.ocaml
              ocaml-ng.ocamlPackages_latest.findlib
              ocaml-ng.ocamlPackages_latest.dune_3
              ocaml-ng.ocamlPackages_latest.ocamlgraph
            ];
            shellHook = ''
              export LANG=C.UTF-8
              export EDITOR=emacs
              eval "$(direnv hook bash)"
              echo "Welcome to nix flake for OCaml"
            '';
          };
        }
    );
}
