# 34-haskell-with-flakes

## Run `flake.nix` for set your DEV envonment up

```bash
$ nix develop
```

## Create a Haskell project by Stack

```bash
$ cd ../
$ stack new <project-name>
$ cd <project-name>
```


## Modify `stack.yaml` file to use Nix

> If you want to change ghc version, please change `ghc-9.4` to what you want

```bash
resolver: ghc-9.4
packages:
- .
nix:
  enable: true
  shell-file: shell.nix
```

## Build your project

``` bash
$ nix-shell
[nix-shell]$ stack build
```

## Run your project

``` bash
[nix-shell]$ stack run
# or
[nix-shell]$ stack exec <project-name>-exe
```
