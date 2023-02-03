{
  description = "11-dev-wsl2";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-untable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = import ./shell.nix { inherit pkgs; };
      }
    );
}
