let
    pkgs = import <nixpkgs> {};
    haskellVersion = "ghc921";
    python3-with-packages = pkgs.python3Full.withPackages (ps: with ps; [
        pip
        # other python packages you want
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
            pkgs.nmon
            pkgs.nnn
            pkgs.p7zip
            pkgs.pgcli
            pkgs.sysstat
            pkgs.tmux
            pkgs.traceroute
            pkgs.tree

            # editor
            pkgs.emacs27-nox
            pkgs.vim
            pkgs.vifm

            # java
            pkgs.jdk17

            # rust
            pkgs.cargo
            pkgs.rustup

            # haskell
            pkgs.haskell.compiler."${haskellVersion}"
            pkgs.haskell-language-server
            pkgs.stylish-haskell
            pkgs.cabal-install
            pkgs.stack
            pkgs.hlint
            pkgs.ghcid
            pkgs.haskellPackages.hindent
            pkgs.haskellPackages.hoogle

            # elm
            elm-with-packages

            # golang
            pkgs.go

            # ocaml
            pkgs.ocaml
            pkgs.opam
            pkgs.ocamlPackages.dune

            # docker
            pkgs.docker
            pkgs.docker-client
            pkgs.docker-compose

            # nodejs
            pkgs.nodejs-16_x
            pkgs.yarn

            # python
            pkgs.python2Full
            python3-with-packages

            # aws
            pkgs.awscli2
            pkgs.aws-sam-cli

        ];
        shellHook = ''
            echo "---------------------------------------------"
            echo "Great!, Nix packages were built successfully."
            echo "---------------------------------------------"
        '';
}
