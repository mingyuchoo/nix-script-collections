# default.nix

## 1) with expresion version
################################################
with import <nixpkgs> {};
    let
        version = "ghc922";
    in
            stdenv.mkDerivation rec {
                name = "<project-name>";
                src = ./.;
                buildInputs = [
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

### 2) function version
################################################
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

## 3) let ... in ... expresion vesion
################################################
#let
#    pkgs = import <nixpkgs> {};
#    version = "ghc921";
#in
#    with pkgs;
#    mkShell {
#        buildInputs =  [
#            haskell.compiler."${version}"
#            cabal-install
#            stack
#            ghcid
#        ];
#        shellHook = ''
#            # execute `stack run` command
#            stack run
#        '';
#    }
