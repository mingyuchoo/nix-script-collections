{ config, pkgs, ... }:

{
  home.username = "mgch";
  home.homeDirectory = "/home/mgch";
  home.stateVersion = "23.11";
  home.packages = [
    pkgs.kate
    pkgs.firefox
    pkgs.microsoft-edge
    pkgs.htop
    pkgs.jq
    pkgs.neovim
    pkgs.netcat
    pkgs.nnn
    pkgs.tmux
    pkgs.tree
    pkgs.unzip
    pkgs.wget
    pkgs.xsel
    pkgs.zip
    pkgs.vscode
    pkgs.maestral
    pkgs.maestral-gui
    pkgs.discord
    pkgs.drawio
    pkgs.slack
    pkgs.telegram-desktop
    pkgs.zoom-us
    pkgs.bun
    pkgs.clang
    pkgs.cargo-modules
    pkgs.cargo-watch
    pkgs.rustup
    pkgs.nodejs-18_x
    pkgs.nodePackages_latest.pnpm
    pkgs.nodePackages_latest.typescript
    pkgs.gradle
    pkgs.jdk17
    pkgs.haskell.compiler.ghc963
    pkgs.haskell.packages.ghc963.cabal-install
    pkgs.haskell.packages.ghc963.ghcid
    pkgs.haskell.packages.ghc963.haskell-language-server
    pkgs.haskell.packages.ghc963.hlint
    pkgs.haskell.packages.ghc963.hoogle
    pkgs.haskell.packages.ghc963.stylish-haskell
    pkgs.haskellPackages.stack
    pkgs.haskellPackages.hindent
    pkgs.haskellPackages.dhall
    pkgs.haskellPackages.dhall-bash
    pkgs.haskellPackages.dhall-json
    pkgs.haskellPackages.dhall-nix
    pkgs.haskellPackages.dhall-toml
    pkgs.haskellPackages.dhall-yaml
    pkgs.ocaml-ng.ocamlPackages_latest.ocaml
    pkgs.ocaml-ng.ocamlPackages_latest.ocamlgraph
    pkgs.ocaml-ng.ocamlPackages_latest.dune_3
    pkgs.ocaml-ng.ocamlPackages_latest.findlib
    pkgs.elmPackages.elm
    pkgs.elmPackages.elm-analyse
    pkgs.elmPackages.elm-doc-preview
    pkgs.elmPackages.elm-format
    pkgs.elmPackages.elm-language-server
    pkgs.elmPackages.elm-live
    pkgs.elmPackages.elm-test
    pkgs.lua5_4
    pkgs.lua-language-server
    pkgs.python3
    pkgs.python3Packages.pip
    pkgs.python3Packages.virtualenv
    pkgs.zig
  ];
  home.file = {
  };
  home.sessionVariables = {
    EDITOR = "emacs";
  };
  home.shellAliases = {
    "..." = "cd ../..";
  };
  nixpkgs.config = {
    allowUnfree = true;
  };
  programs.home-manager.enable = true;
    programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };
  programs.emacs = {
    enable = true;
    extraConfig = ''
      (setq standard-indent 2)
    '';
    extraPackages = epkgs: [
      epkgs.nix-mode
      epkgs.magit
    ];
  };
  programs.firefox.enable = true;
  programs.git = {
    enable = true;
    aliases = {
      ls = "log --graph --pretty=onelone";
    };
    attributes = [
    ];
    delta.enable = true;
    extraConfig = {
      core = {
        editor = "emacs";
        autocrlf = "input";
        longpaths = true;
      };
      credential = {
        helper = "store";
      };
    };
    userName = "Mingyu Choo";
    userEmail = "mingyuchoo@gmail.com";
  };
}
