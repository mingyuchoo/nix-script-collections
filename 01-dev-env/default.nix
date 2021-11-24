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
            pkgs.htop
            pkgs.nmon
            pkgs.nnn
            pkgs.p7zip
            pkgs.sysstat
            pkgs.traceroute
            pkgs.tree
            pkgs.tmux
            pkgs.hurl
            pkgs.exa
            pkgs.jq
            pkgs.git

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
