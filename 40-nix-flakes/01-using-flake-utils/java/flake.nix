{
  description = "A basic flakes using flake-utils for Java";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        rec {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              coursier
              direnv
              jdk17
              gradle
              sbt
            ];
            shellHook = ''
              export LANG=C.UTF-8
              export EDITOR=emacs
              export PS1="\\e[1;36m(develop) \u@\h:\W > \\e[0m"
              eval "$(direnv hook bash)"
              echo "Welcome to Nix flake for Java"
            '';
          };
        }
    );
}
