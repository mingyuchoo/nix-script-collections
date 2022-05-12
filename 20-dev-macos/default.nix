let
  pkgs = import <nixpkgs> {};
  python3-with-packages = pkgs.python3Full.withPackages (ps: with ps; [
    pip
    # other python packages you want
  ]);
  haskell-with-packages = pkgs.ghc.withPackages (ps: with ps; [
    stack
    stylish-haskell
    hindent
    hlint
    ghcid
  ]);
  elm-with-packages = with pkgs.elmPackages; [
    elm
    elm-analyse
    elm-doc-preview
    elm-format
    elm-live
    elm-test
  ];
in
  pkgs.mkShell {
    buildInputs = [
      pkgs.cmatrix
      pkgs.curl
      pkgs.exa
      pkgs.git
      pkgs.hurl
      pkgs.htop
      pkgs.jq
      pkgs.nnn
      pkgs.p7zip
      pkgs.pgcli
      pkgs.tmux
      pkgs.tree
      pkgs.wget

      # editor
      pkgs.emacs
      pkgs.vim
      pkgs.vifm

      # java
      pkgs.jdk

      # rust
      pkgs.cargo
      pkgs.rustup

      # haskell
      haskell-with-packages

      # elm
      elm-with-packages

      # docker
      pkgs.docker
      pkgs.docker-client
      pkgs.docker-compose_2

      # nodejs
      pkgs.nodejs-16_x

      # python
      pkgs.python2Full
      python3-with-packages

    ];
    shellHook = ''
      echo "---------------------------------------------"
      echo "Great!, Nix packages were built successfully."
      echo "---------------------------------------------"
    '';
}
