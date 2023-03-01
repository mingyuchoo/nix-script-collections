let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "dhall";
    buildInputs = [
      pkgs.direnv
      pkgs.haskellPackages.dhall
      pkgs.haskellPackages.dhall-bash
      pkgs.haskellPackages.dhall-docs
      pkgs.haskellPackages.dhall-json
      pkgs.haskellPackages.dhall-lsp-server
      pkgs.haskellPackages.dhall-nix
      pkgs.haskellPackages.dhall-openapi
      pkgs.haskellPackages.dhall-toml
      pkgs.haskellPackages.dhall-yaml
    ];
    shellHook = ''
      export EDITOR=emacs
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for Dhall configuration language!"
    '';
  }
