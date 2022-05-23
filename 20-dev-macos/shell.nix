{ pkgs ? import <nixpkgs> {} }: with pkgs;

let
  haskellVersion = "ghc922";

  elm-with-packages = with pkgs.elmPackages; [
    elm
    elm-analyse
    elm-doc-preview
    elm-format
    elm-live
    elm-test
  ];

in
  mkShell {
  buildInputs = [
    pkgs.curl
    pkgs.exa
    pkgs.git
    pkgs.hurl
    pkgs.htop
    pkgs.jq
    pkgs.nnn
    pkgs.p7zip
    pkgs.tree

    # editor
    pkgs.emacs28-nox
    pkgs.vim

    # java
    pkgs.jdk11

    # rust
    pkgs.cargo
    pkgs.rustup

    # haskell
    pkgs.haskell.compiler."${haskellVersion}"
    pkgs.haskellPackages.cabal-install
    pkgs.haskellPackages.haskell-language-server
    pkgs.haskellPackages.stack
    pkgs.haskellPackages.stylish-haskell
    pkgs.haskellPackages.ghci
    pkgs.haskellPackages.ghcid
    pkgs.haskellPackages.hindent
    pkgs.haskellPackages.hlint
    pkgs.haskellPackages.hoogle

    # elm
    elm-with-packages

    # golang
    pkgs.go

    # ocaml
    pkgs.ocamlPackages.ocaml
    pkgs.opam

    # terraform
    pkgs.terraform

    # nodejs
    pkgs.nodejs-16_x
    pkgs.yarn

    # ansible
    pkgs.ansible

    # aws
    pkgs.awscli2
    pkgs.aws-sam-cli
  ];

  shellHook = ''
    PS1="\n\[\033[1;36m\][nix develop:\w]\$ \[\033[0m\]"
    echo "---------------------------------------------"
    echo "Great!, Nix packages were built successfully."
    echo "---------------------------------------------"
  '';
  }
