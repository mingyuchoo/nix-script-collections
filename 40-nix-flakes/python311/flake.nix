{
  description = "A basic devShell using flake-utils for Python3";

  inputs = {
    # flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs, }:
    let
      allSystems = [
        "aarch64-linux"
        "aarch64-darwin"
      ];

      forAllSystems = f:
        nixpkgs.lib.genAttrs allSystems
          (system: f { pkgs = import nixpkgs { inherit system; }; });
    in
      {
        devShells = forAllSystems ({ pkgs }: {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              direnv
              python311Full
              python311Packages.pip
              python311Packages.virtualenv
            ];
            shellHook = ''
              export LANG=C.UTF-8
              export EDITOR=emacs
              export PS1="\\e[1;34m(develop) \u@\h:\W > \\e[0m"
              eval "$(direnv hook bash)"
              echo "Welcome to nix flake for Python3"
            '';
          };
        });
      };
}
