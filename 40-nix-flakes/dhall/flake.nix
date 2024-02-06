{
  description = "A basic devShell using flake-utils for Dhall";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
        rec {
          devShells.default = pkgs.mkShell {
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
              export LANG=C.UTF-8
              export EDITOR=emacs
              export PS1="\\e[1;34mdevelop > \\e[0m"
              eval "$(direnv hook bash)"
              echo "Welcome to nix flake for Dhall"
            '';
          };
        }
    );
}
