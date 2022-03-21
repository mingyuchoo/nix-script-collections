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

            # docker
            pkgs.docker
            pkgs.docker-client
            pkgs.docker-compose
            
            # terraform
            pkgs.terraform

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
