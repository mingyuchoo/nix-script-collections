{
  description = "A basic devShell using flake-utils for Kotlin";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
        rec {
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              coursier
              direnv
              gradle
              jdk17
              kotlin
              kotlin-language-server
              sbt
            ];
            shellHook = ''
              export LANG=C.UTF-8
              export EDITOR=emacs
              export PS1="\\e[1;34mdevelop > \\e[0m"
              eval "$(direnv hook bash)"
              echo "Welcome to nix flake for Kotlin"
            '';
          };
        }
    );
}
