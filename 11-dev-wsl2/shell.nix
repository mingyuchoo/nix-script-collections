let
    pkgs = import <nixpkgs> {};
    python3-with-packages = pkgs.python3Full.withPackages (ps: with ps; [
        pip
        # other python packages you want
    ]);
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
            pkgs.emacs28-nox
            pkgs.vim
            pkgs.vifm

            # java
            pkgs.jdk11

            # docker
            pkgs.docker
            pkgs.docker-client
            pkgs.docker-compose
            
            # terraform
            pkgs.terraform

            # nodejs
            pkgs.nodejs-14_x
            pkgs.yarn

            # python
            pkgs.python2Full
            python3-with-packages

            # ansible
            pkgs.ansible

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
