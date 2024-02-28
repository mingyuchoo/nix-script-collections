let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "haskell";
    buildInputs = with pkgs; [
      direnv
      haskell.compiler.ghc963
      haskellPackages.cabal-install
      haskellPackages.haskell-language-server
      haskellPackages.stack
      haskellPackages.stylish-haskell
      haskellPackages.ghci
      haskellPackages.ghcid
      haskellPackages.hindent
      haskellPackages.hlint
      haskellPackages.hoogle
    ];
    shellHook = ''
      export EDITOR=emacs
      export PS1="\\e[1;36m(shell) \u@\h:\W > \\e[0m"
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for Haskell!"
    '';
  }
