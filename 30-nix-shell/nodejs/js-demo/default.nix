# default.nix

{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {

  name = "js-demo";
  src = ./.;

  buildInputs = [ pkgs.nodejs ];

  installPhase = ''
    mkdir -p $out
    cp index.js $out/
  '';
}

