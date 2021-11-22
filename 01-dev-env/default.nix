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

            # editor
            pkgs.emacs
            pkgs.vim

            # development
            pkgs.elmPackages.elm
            pkgs.git
            pkgs.nodejs-16_x
            pkgs.jdk

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
