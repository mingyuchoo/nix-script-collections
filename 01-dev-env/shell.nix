{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = [
      pkgs.buildPackages.cmatrix
      pkgs.buildPackages.curl
      pkgs.buildPackages.htop
      pkgs.buildPackages.nmon
      pkgs.buildPackages.nnn
      pkgs.buildPackages.p7zip
      pkgs.buildPackages.sysstat
      pkgs.buildPackages.traceroute
      pkgs.buildPackages.tree
      # editor
      pkgs.buildPackages.emacs
      pkgs.buildPackages.vim
      # development
      pkgs.buildPackages.elmPackages.elm
      pkgs.buildPackages.git
      pkgs.buildPackages.nodejs-16_x
      pkgs.buildPackages.jdk
      # haskell
      pkgs.buildPackages.ghc
      pkgs.buildPackages.stack
      # rust
      pkgs.buildPackages.cargo
      pkgs.buildPackages.rustup
    ];
}
