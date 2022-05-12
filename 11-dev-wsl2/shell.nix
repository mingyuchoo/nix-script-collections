{ pkgs ? import <nixpkgs> { } }: with pkgs;

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
    pkgs.exa
    pkgs.git
    pkgs.hurl
    pkgs.htop
    pkgs.jq
    pkgs.nmon
    pkgs.nnn
    pkgs.p7zip
    pkgs.sysstat
    pkgs.traceroute
    pkgs.tree

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

    # podman
    dockerCompat
    pkgs.podman  # Docker compat
    pkgs.runc    # Container runtime
    pkgs.conmon  # Container runtime monitor
    pkgs.skopeo  # Interact with container registry
    pkgs.slirp4netns     # User-mode networking for unprivileged namespaces
    pkgs.fuse-overlayfs  # CoW for images, much faster than default vfs
    pkgs.podman-compose  # alternative for docker-compose
    
    # terraform
    pkgs.terraform

    # nodejs
    pkgs.nodejs-16_x
    pkgs.yarn

    # python
    pkgs.python310
    pkgs.python310Packages.pip

    # ansible
    pkgs.ansible

    # aws
    pkgs.awscli2
    pkgs.aws-sam-cli
  ];

  shellHook = ''
    echo "---------------------------------------------"
    echo "Great!, Nix packages were built successfully."
    echo "---------------------------------------------"
  '';
  }
