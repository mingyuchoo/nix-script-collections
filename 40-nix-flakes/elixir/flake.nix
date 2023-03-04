{
  description = "A basic devShell using flake-utils for Elixir";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
        rec {
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              direnv
              beam.packages.erlangR25.elixir_1_14
            ];
            shellHook = ''
              export EDITOR=emacs
              eval "$(direnv hook bash)"
              echo "Welcome to nix flake for Elixir"
            '';
          };
        }
    );
}
