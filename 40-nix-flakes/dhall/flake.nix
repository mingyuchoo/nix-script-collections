{
  description = "A basic devShell using flake-utils for Dhall";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
        rec {
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              direnv
              haskellPackages.dhall
              haskellPackages.dhall-bash
              haskellPackages.dhall-docs
              haskellPackages.dhall-json
              haskellPackages.dhall-lsp-server
              haskellPackages.dhall-nix
              haskellPackages.dhall-openapi
              haskellPackages.dhall-toml
              haskellPackages.dhall-yaml
            ];
            shellHook = ''
              export EDITOR=emacs
              eval "$(direnv hook bash)"
              echo "Welcome to nix flake for Dhall"
            '';
          };
        }
    );
}
