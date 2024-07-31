{ config, pkgs, ... }:

{
  home.username = "mgch";
  home.homeDirectory = "/home/mgch";
  home.stateVersion = "23.11";
  home.packages = with pkgs; [
    # c/c++
    clang
    clang-tools
    cmake
    gnumake
    lld
    llvm
    # bun
    bun
    # elixir 
    elixir_1_16
    elixir-ls
    erlang_26
    # elm
    elmPackages.elm
    elmPackages.elm-analyse
    elmPackages.elm-doc-preview
    elmPackages.elm-format
    elmPackages.elm-language-server
    elmPackages.elm-live
    elmPackages.elm-test
    # haskell
    haskell.compiler.ghc963
    haskell.packages.ghc963.cabal-install
    haskell.packages.ghc963.ghcid
    haskell.packages.ghc963.haskell-language-server
    haskell.packages.ghc963.hlint
    haskell.packages.ghc963.hoogle
    haskell.packages.ghc963.stylish-haskell
    haskellPackages.dhall
    haskellPackages.dhall-bash
    haskellPackages.dhall-json
    haskellPackages.dhall-nix
    haskellPackages.dhall-toml
    haskellPackages.dhall-yaml
    haskellPackages.hindent
    haskellPackages.stack
    # java
    gradle
    jdk17
    # lua
    lua-language-server
    lua5_4
    # ocaml
    opam
    # node
    nodePackages_latest.pnpm
    nodePackages_latest.typescript
    nodejs-18_x
    yarn
    # python
    python3
    python3Packages.pip
    python3Packages.virtualenv
    # rust
    rustup
    # zig
    zig
    # lib
    ifuse
    inotify-tools
    libimobiledevice
    libreoffice
    openssl
    pkg-config
    # CLI
    direnv
    emacs29-gtk3
    fuse3
    git
    htop
    hurl
    jq
    lazydocker
    neovim
    netcat
    packer
    terraform
    tmux
    tree
    unzip
    wget
    xsel
    zip
    # GUI
    dbeaver
    discord
    drawio
    maestral
    maestral-gui
    microsoft-edge
    slack
    telegram-desktop
    vscode
    zoom-us
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
