let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "Lua";
    buildInputs = [
      pkgs.direnv
      pkgs.lua-language-server
      pkgs.lua5
    ];
    shellHook = ''
      export EDITOR=emacs
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for Lua!"
    '';
  }
