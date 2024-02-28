let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "rust";
    buildInputs = [
      pkgs.cargo
      pkgs.cargo-watch
      pkgs.cargo-modules
      pkgs.cargo-lambda
      pkgs.clippy
      pkgs.direnv
      pkgs.gcc
      pkgs.rustc
      pkgs.rustfmt
      pkgs.rustup
    ];
    shellHook = ''
      export EDITOR=emacs
      export PS1="\\e[1;36m(shell) \u@\h:\W > \\e[0m"
      eval "$(direnv hook bash)"
      echo Welcome to nix-shell for Rust!
    '';
  }
