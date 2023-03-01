# 51-haskell

## 1. Manually

### Source code

```haskell
-- HelloWorld.hs
module Main where

main :: IO ()
main = putStrLn "Hello World"
```

### How to run

```bash
# This drops us in a bash shell with ghc package installed and $PATH updated.
$ nix-shell -p ghc
...
# Now let's run our module.
[nix-shell:~] runhaskell HelloWorld.hs
Hello World
```

## 2. Manually with a package

### Source code

```haskell
-- HelloWorld.hs
module Main where

import Brick

ui :: Widget ()
ui = str "Hello, World!"

main :: IO ()
main = simpleMain ui
```

### How to run

```bash
# This drops us in a bash shell with ghc package installed and $PATH updated.
$ nix-shell \
    -p "haskellPackages.ghcWithPackages (p: [p.brick])" \
    --run "runhaskell HelloWorld.hs"
...
# Now let's run our module.
[nix-shell:~] runhaskell HelloWorld.hs
Hello World
```

## 3. Scripts in source code

### Source code

```haskell
-- HelloWorld.hs
#! /usr/bin/env nix-shell
#! nix-shell -p "haskellPackages.ghcWithPackages (p: [p.brick])"
#! nix-shell -i "runhaskell HelloWorld.hs"

module Main where

import Brick

ui :: Widget ()
ui = str "Hello, World!"

main :: IO ()
main = simpleMain ui
```

### How to run

```bash
$ chmod +x HelloWorld.hs
$ ./HelloWorld.hs
Hello World
```

## 4. Nix scripts out of source code (mkShell)

### Source code

```haskell
-- HelloWorld.hs
#! /usr/bin/env nix-shell
#! nix-shell -i "runhaskell HelloWorld.hs"

module Main where

import Brick

main :: IO ()
main = simpleMain ui

ui :: Widget ()
ui = str "Hello, World!"
```

### Nix script

```nix
# shell.nix
let
    pkgs = import <nixpkgs> {};
    ghc = pkgs.haskell.packages.ghc94.ghcWithPackages (ps: [ ps.brick ]);
in
    with pkgs;
    mkShell {
        buildInputs = [
            ghc
        ];
    }
```

### How to run

```bash
$ chmod +x HelloWorld.hs
$ ./HelloWorld.hs
Hello World
```

## 5. Nix scripts out of source code (mkDerivation)

### Source code

```haskell
-- HelloWorld.hs
#! /usr/bin/env nix-shell
#! nix-shell -i "runhaskell HelloWorld.hs"

module Main where

import Brick

main :: IO ()
main = simpleMain ui

ui :: Widget ()
ui = str "Hello, World!"
```

### Nix script

```nix
# shell.nix
let
    pkgs = import <nixpkgs> {};
    ghc = pkgs.haskell.packages.ghc94.ghcWithPackages (ps: [ ps.brick ]);
in
    pkgs.stdenv.mkDerivation {
        name = "HelloWorld";
        buildInputs = [ ghc ];
    }

```

### How to run

```bash
$ chmod +x HelloWorld.hs
$ ./HelloWorld.hs
Hello World
```

# Many styles of `default.nix`

## `with` expression style

```nix
with import <nixpkgs> {};
  let
    version = "ghc94";
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
```

## `let ... in ...` expression style

```nix
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
```

## function style

```nix
{ pkgs ? import <nixpkgs> {}
} :
let
  version = "ghc921";
in
  with pkgs;
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
```
