{ pkgs ? import <nixpkgs> {} }: with pkgs;

let
  haskellVersion = "ghc94";

  elm-with-packages = with pkgs.elmPackages; [
    elm
    elm-analyse
    elm-doc-preview
    elm-format
    elm-language-server
    elm-live
    elm-test
  ];

in
  mkShell {
  buildInputs = [
    pkgs.curl
    pkgs.exa
    pkgs.fx
    pkgs.git
    pkgs.hurl
    pkgs.htop
    pkgs.jq
    pkgs.cmatrix
    pkgs.nnn
    pkgs.p7zip
    pkgs.tree
    pkgs.visidata

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

    # deno
    pkgs.deno

    ## ansible
    #pkgs.ansible

    ## aws
    #pkgs.awscli2
    #pkgs.aws-sam-cli
  ];

  shellHook = ''
    mkdir -p $HOME/.npm-packages/bin
    mkdir -p $HOME/.npm-packages/lib/node_modules

    export PATH="$HOME/.npm-packages/bin:$PATH"
    export NODE_PATH="$HOME/.npm-packages/lib/node_modules"
    export EDITOR=emacs

    PS1="\n\[\033[1;36m\][nix develop:\w]\n\$ \[\033[0m\]"

    echo "---------------------------------------------"
    echo "Great!, Nix packages were built successfully."
    echo "---------------------------------------------"
  '';
  }
