{
  description = "A basic devShell using flake-utils for Python3";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        packageName = "myapp";
      in
        rec {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              direnv
              python311Full
              python311Packages.pip
              python311Packages.virtualenv
            ];
            shellHook = ''
              export LANG=C.UTF-8
              export EDITOR=emacs
              export PS1="\\e[1;36m(develop) \u@\h:\W > \\e[0m"
              eval "$(direnv hook bash)"
              echo "Welcome to nix flake for Python3"
            '';
          };

          packages.default = pkgs.stdenv.mkDerivation {
            name = "${packageName}";
            pname = "${packageName}";
            version = "1.0";
            src = self;
            buildInputs = with pkgs; [
              python311Full
            ];
            installPhase = ''
              mkdir -p $out/bin
              install -t $out/bin app.py
            '';
          };

          apps.default = {
            type = "app";
            program = "${self.packages.${system}.default}/bin/app.py";
          };
        }
    );
}
