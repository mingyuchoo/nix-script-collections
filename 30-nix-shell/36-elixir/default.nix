let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "exlixir";
    buildInputs = [
      pkgs.beam.packages.erlangR25.elixir_1_14
    ];
    shellHook = ''
      echo "Welcome to nix-shell for Elixir!"
    '';
  }
