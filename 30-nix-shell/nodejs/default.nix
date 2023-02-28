### 1) with expresion version
##################################################
#with import <nixpkgs> {};
#  stdenv.mkDerivation {
#    name = "node";
#    buildInputs = [
#      yarn
#      nodejs-16_x
#    ];
#    shellHook = ''
#      export EDITOR=emacs
#      eval "$(direnv hook bash)"
#      export PATH="$PWD/node_modules/.bin:$PATH"
#      alias run='npm run'
#    '';
#  }

## 2) function version
##################################################
#{ pkgs ? import <nixpkgs> {}
#} :
#with pkgs;
#  stdenv.mkDerivation {
#    name = "node";
#    buildInputs = [
#      yarn
#      nodejs-16_x
#    ];
#    shellHook = ''
#      export EDITOR=emacs
#      eval "$(direnv hook bash)"
#      export PATH="$PWD/node_modules/.bin:$PATH"
#      alias run='npm run'
#    '';
#  }

## 3) let ... in ... expresion version
##################################################
let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "nodejs";
    buildInputs = [
      pkgs.direnv
      pkgs.yarn
      pkgs.nodejs-18_x
    ];
    shellHook = ''
      export EDITOR=emacs
      export PATH="$PWD/node_modules/.bin:$PATH"
      alias run='npm run'
      eval "$(direnv hook bash)"
      echo "Welcome to nix-shell for Nodejs"
    '';
  }
