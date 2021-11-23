let
    pkgs = import <nixpkgs> {};
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

            # editor
            pkgs.emacs
            pkgs.vim

            # aws
            pkgs.awscli2
            pkgs.aws-sam-cli
            
            # development
            pkgs.elmPackages.elm
            pkgs.git
            pkgs.nodejs-16_x
            pkgs.jdk
            
            # docker
            pkgs.docker
            pkgs.docker-client
            pkgs.docker-compose_2
            
            # python
            pkgs.python2Full
            pkgs.python3Full
            
            # haskell
            pkgs.ghc
            pkgs.stack

            # rust
            pkgs.cargo
            pkgs.rustup
        ];
        shellHook = ''
            echo "Great!, Nix packages were built successfully."
        '';
}
