{
  description = "A basic flakes using nixpkgs for Rust";

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

      packageName = "my-rust-app";
    in
      {
        devShells = forAllSystems ({ pkgs }: {
          default = pkgs.mkShell {
                buildInputs = with pkgs; [
                  direnv
                  cargo
                  rustc
                ];
                shellHook = ''
                  export LANG=C.UTF-8
                  export EDITOR=emacs
                  export PS1="\\e[1;36m(develop) \u@\h:\W > \\e[0m"
                  eval "$(direnv hook bash)"
                  echo "Welcome to Nix flake for Rust"
                '';
          };
        });
        packages = forAllSystems ({ pkgs }: {
          default = pkgs.rustPlatform.buildRustPackage {
            pname = "${packageName}";
            version = "0.1.0";
            src = self;
            cargoLock.lockFile = ./Cargo.lock;
            };
        });
        apps = forAllSystems ({ pkgs }: {
          default = {
            type = "app";
            program = "${self.packages.${pkgs.system}.default}/bin/${packageName}";
          };
        });
      };
}
