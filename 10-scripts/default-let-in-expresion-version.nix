# default.nix

## let ... in ... expresion vesion
let
    pkgs = import <nixpkgs> {};
    version = "ghc921";
in
    with pkgs;
    mkShell {
        buildInputs =  [
            haskell.compiler."${version}"
            cabal-install
            stack
            ghcid
        ];
        shellHook = ''
            # execute `stack run` command
            stack run
        '';
    }


### function version
#{ pkgs ? import <nixpkgs> {}
#} :
#let
#    version = "ghc921";
#in
#    with pkgs;
#        stdenv.mkDerivation rec {
#            name = "<project-name>";
#            src = ./.;
#            buildInputs = [
#                haskell.compiler."${version}"
#                cabal-install
#                stack
#                ghcid
#            ];
#            shellHook = ''
#                # execute `stack run` command
#                stack run
#            '';
#        }

