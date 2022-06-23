{ pkgs ? import <nixpkgs> {} }: with pkgs;

let
  haskellVersion = "ghc922";

  elm-with-packages = with pkgs.elmPackages; [
    elm
    elm-analyse
    elm-doc-preview
    elm-format
    elm-live
    elm-test
  ];

  podmanSetupScript =
  let
    registriesConf = pkgs.writeText "registries.conf" ''
      [registries.search]
      registries = ['docker.io']
      [registries.block]
      registries = []
    '';
  in pkgs.writeScript "podman-setup" ''
    #!${pkgs.runtimeShell}
    # Dont overwrite customised configuration
    if ! test -f ~/.config/containers/policy.json; then
      install -Dm555 ${pkgs.skopeo.src}/default-policy.json ~/.config/containers/policy.json
    fi
    if ! test -f ~/.config/containers/registries.conf; then
      install -Dm555 ${registriesConf} ~/.config/containers/registries.conf
    fi
  '';

  dockerCompat = pkgs.runCommandNoCC "docker-podman-compat" {} ''
    mkdir -p $out/bin
    ln -s ${pkgs.podman}/bin/podman $out/bin/docker
  '';
in
  mkShell {
  buildInputs = [
    pkgs.curl
    pkgs.flyway
    pkgs.fx
    pkgs.git
    pkgs.hurl
    pkgs.htop
    pkgs.jq
    pkgs.nmon
    pkgs.nnn
    pkgs.p7zip
    pkgs.rename
    pkgs.nettools
    pkgs.sqlite
    pkgs.sysstat
    pkgs.tmux
    pkgs.traceroute
    pkgs.tree
    pkgs.visidata

    # editor
    pkgs.emacs28-nox
    pkgs.vim

    # java
    pkgs.jdk11

    # rust
    pkgs.cargo
    pkgs.rustup

    # haskell
    pkgs.haskell.compiler."${haskellVersion}"
    pkgs.haskellPackages.cabal-install
    pkgs.haskellPackages.haskell-language-server
    pkgs.haskellPackages.stack
    pkgs.haskellPackages.stylish-haskell
    pkgs.haskellPackages.ghci
    pkgs.haskellPackages.ghcid
    pkgs.haskellPackages.hindent
    pkgs.haskellPackages.hlint
    pkgs.haskellPackages.hoogle

    # elm
    elm-with-packages

    # golang
    pkgs.go

    # ocaml
    pkgs.ocamlPackages.ocaml
    pkgs.opam

    # erlang
    pkgs.erlang

    # elixir
    pkgs.elixir

    # julia
    pkgs.julia_17-bin

    # zig
    pkgs.zig

    # docker
    pkgs.docui

    # podman
    #dockerCompat
    #pkgs.podman  # Docker compat
    #pkgs.runc    # Container runtime
    #pkgs.conmon  # Container runtime monitor
    #pkgs.skopeo  # Interact with container registry
    #pkgs.slirp4netns     # User-mode networking for unprivileged namespaces
    #pkgs.fuse-overlayfs  # CoW for images, much faster than default vfs
    #pkgs.podman-compose  # alternative for docker-compose

    # terraform
    pkgs.terraform

    # nodejs
    pkgs.nodejs-16_x
    pkgs.yarn

    # deno
    pkgs.deno

    # ansible (using python3.9.x)
    #pkgs.ansible

    # aws (using python3.9.x)
    #pkgs.awscli2
    #pkgs.aws-sam-cli
  ];

  shellHook = ''
    mkdir -p $HOME/.npm-packages/bin
    mkdir -p $HOME/.npm-packages/lib/node_modules

    export PATH="$HOME/.npm-packages/bin:$PATH"
    export NODE_PATH="$HOME/.npm-packages/lib/node_modules"
    export EDITOR=emacs

    PS1="\n\[\033[1;36m\][nix develop:\w]\n\$ \[\033[0m\]"

    npm config set strict-ssl false -g
    npm config set registry http://registry.npmjs.org/

    echo "---------------------------------------------"
    echo "Great!, Nix packages were built successfully."
    echo "---------------------------------------------"
  '';
  }
