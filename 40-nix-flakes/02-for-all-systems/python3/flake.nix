{
  description = "A basic devShell using nixpkgs for Python3";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      forAllSystems = f:
        nixpkgs.lib.genAttrs systems
          (system: f { pkgs = import nixpkgs { inherit system; }; });

      packageName = "myapp";
    in
      {
        devShells = forAllSystems ({ pkgs }: {
          default = pkgs.mkShell {
                buildInputs = with pkgs; [
                  direnv
                  python3
                  python3Packages.pip
                  python3Packages.virtualenv
                ];
                shellHook = ''
                  export LANG=C.UTF-8
                  export EDITOR=emacs
                  export PS1="\\e[1;36m(develop) \u@\h:\W > \\e[0m"
                  eval "$(direnv hook bash)"
                  echo "Welcome to nix flake for Python3"
                '';
          };
        });
        packages = forAllSystems ({ pkgs }: {
          default = pkgs.stdenv.mkDerivation {
            name = "${packageName}";
            pname = "${packageName}";
            version = "1.0";
            src = self;
            buildInputs = with pkgs; [ python3 ];
            installPhase = ''
              mkdir -p $out/bin
              install -t $out/bin app.py
            '';
            };
        });
        apps = forAllSystems ({ pkgs }: {
          default = {
            type = "app";
            program = "${self.packages.${pkgs.system}.default}/bin/app.py";
          };
        });
      };
}
