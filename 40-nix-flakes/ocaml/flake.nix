{
  description = "A basic devShell using flake-utils for OCaml";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
        rec {
          devShells.default = pkgs.mkShell {
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
              export PS1="\\e[1;36m(develop) \u@\h:\W > \\e[0m"
              eval "$(direnv hook bash)"
              echo "Welcome to nix flake for OCaml"
            '';
          };
        }
    );
}
