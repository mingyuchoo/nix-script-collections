{ config, pkgs, ... }:

{
  home.username = "mgch";
  home.homeDirectory = "/home/mgch";
  home.stateVersion = "23.11";
  home.packages = [
    pkgs.beekeeper-studio
    pkgs.brave
    pkgs.bun
    pkgs.cargo-modules
    pkgs.cargo-watch
    pkgs.clang
    pkgs.cmake
    pkgs.dbeaver
    pkgs.direnv
    pkgs.discord
    pkgs.drawio
    pkgs.elixir_1_16
    pkgs.elixir-ls
    pkgs.elmPackages.elm
    pkgs.elmPackages.elm-analyse
    pkgs.elmPackages.elm-doc-preview
    pkgs.elmPackages.elm-format
    pkgs.elmPackages.elm-language-server
    pkgs.elmPackages.elm-live
    pkgs.elmPackages.elm-test
    pkgs.emacs29-gtk3
    pkgs.erlang_26
    pkgs.fuse3
    pkgs.git
    pkgs.gnumake
    pkgs.gradle
    pkgs.haskell.compiler.ghc963
    pkgs.haskell.packages.ghc963.cabal-install
    pkgs.haskell.packages.ghc963.ghcid
    pkgs.haskell.packages.ghc963.haskell-language-server
    pkgs.haskell.packages.ghc963.hlint
    pkgs.haskell.packages.ghc963.hoogle
    pkgs.haskell.packages.ghc963.stylish-haskell
    pkgs.haskellPackages.dhall
    pkgs.haskellPackages.dhall-bash
    pkgs.haskellPackages.dhall-json
    pkgs.haskellPackages.dhall-nix
    pkgs.haskellPackages.dhall-toml
    pkgs.haskellPackages.dhall-yaml
    pkgs.haskellPackages.hindent
    pkgs.haskellPackages.stack
    pkgs.htop
    pkgs.hurl
    pkgs.ifuse
    pkgs.inotify-tools
    pkgs.jdk17
    pkgs.jq
    pkgs.kate
    pkgs.lazydocker
    pkgs.libimobiledevice
    pkgs.libreoffice
    pkgs.lua-language-server
    pkgs.lua5_4
    pkgs.maestral
    pkgs.maestral-gui
    pkgs.microsoft-edge
    pkgs.neovim
    pkgs.netcat
    pkgs.nnn
    pkgs.nodePackages_latest.pnpm
    pkgs.nodePackages_latest.typescript
    pkgs.nodejs-18_x
    pkgs.ocaml-ng.ocamlPackages_latest.dune_3
    pkgs.ocaml-ng.ocamlPackages_latest.findlib
    pkgs.ocaml-ng.ocamlPackages_latest.ocaml
    pkgs.ocaml-ng.ocamlPackages_latest.ocamlgraph
    pkgs.openssl
    pkgs.packer
    pkgs.pkg-config
    pkgs.python3
    pkgs.python3Packages.pip
    pkgs.python3Packages.virtualenv
    pkgs.ranger
    pkgs.rustup
    pkgs.slack
    pkgs.telegram-desktop
    pkgs.terraform
    pkgs.tmux
    pkgs.tree
    pkgs.unzip
    pkgs.vscode
    pkgs.wget
    pkgs.xsel
    pkgs.yarn
    pkgs.zig
    pkgs.zip
    pkgs.zoom-us
  ];
  home.file = {
  };
  home.sessionVariables = {
    EDITOR = "emacs";
  };
  nixpkgs.config = {
    allowUnfree = true;
  };
  programs.home-manager.enable = true;
}
