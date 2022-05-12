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
    name = "node";
    buildInputs = [
      pkgs.yarn
      pkgs.nodejs-16_x
    ];
    shellHook = ''
      export PATH="$PWD/node_modules/.bin:$PATH"
      alias run='npm run'
    '';
  }
