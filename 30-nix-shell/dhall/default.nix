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
      export PS1="\\e[1;36m(shell) \u@\h:\W > \\e[0m"
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for Dhall configuration language!"
    '';
  }
