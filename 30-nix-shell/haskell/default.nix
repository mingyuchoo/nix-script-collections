let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "haskell";
    buildInputs = [
      pkgs.direnv
      pkgs.haskell.compiler.ghc963
      pkgs.haskellPackages.cabal-install
      pkgs.haskellPackages.haskell-language-server
      pkgs.haskellPackages.stack
      pkgs.haskellPackages.stylish-haskell
      pkgs.haskellPackages.ghci
      pkgs.haskellPackages.ghcid
      pkgs.haskellPackages.hindent
      pkgs.haskellPackages.hlint
      pkgs.haskellPackages.hoogle
    ];
    shellHook = ''
      export EDITOR=emacs
      export PS1="\\e[1;36m(shell) \u@\h:\W > \\e[0m"
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for Haskell!"
    '';
  }
