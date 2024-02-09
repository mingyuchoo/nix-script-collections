# README

## References

-<https://nixos-and-flakes.thiscute.world/nixos-with-flakes/nixos-with-flakes-enabled>

## How to create a project using Nix Flakes

```bash
$ mkdir <my-project-name>
$ nix flake show templates
github:NixOS/templates/35355cc7ba4822de499744bb3f3552008ea68970
├───defaultTemplate: template: A very basic flake
└───templates
    ├───bash-hello: template: An over-engineered Hello World in bash
    ├───c-hello: template: An over-engineered Hello World in C
    ├───compat: template: A default.nix and shell.nix for backward compatibility with Nix installations that don't support flakes
    ├───dotnet: template: A .NET application and test project
    ├───empty: template: A flake with no outputs
    ├───full: template: A template that shows all standard flake outputs
    ├───go-hello: template: A simple Go package
    ├───haskell-hello: template: A Hello World in Haskell with one dependency
    ├───haskell-nix: template: An haskell.nix template using hix
    ├───hercules-ci: template: An example for Hercules-CI, containing only the necessary attributes for adding to your project.
    ├───pandoc-xelatex: template: A report built with Pandoc, XeLaTex and a custom font
    ├───python: template: Python template, using poetry2nix
    ├───rust: template: Rust template, using Naersk
    ├───rust-web-server: template: A Rust web server including a NixOS module
    ├───simpleContainer: template: A NixOS container running apache-httpd
    ├───trivial: template: A very basic flake
    └───utils-generic: template: Simple, all-rounder template with utils enabled and devShell populated

$ nix flake init -t templates#<flake-template-name>
$ cat flake.nix
$ nix run
$ nix shell
```
