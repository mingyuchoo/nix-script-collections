{
  description = "A basic devShell using nixpkgs for Python311";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs, }:
    let
      systems = [
        "aarch64-linux"
        "aarch64-darwin"
      ];

      forAllSystems = f:
        nixpkgs.lib.genAttrs systems
          (system: f { pkgs = import nixpkgs { inherit system; }; });
    in
      {
        devShells = forAllSystems ({ pkgs }: {
          default =
            let
            in
              pkgs.mkShell {
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
        packages = forAllSystems ({ pkgs }: {
          default =
            let
            in
              pkgs.stdenv.mkDerivation {
                name = "python311_app";
                pname = "python311_app";
                dontBuild = true;
              };
        });
      };
}
