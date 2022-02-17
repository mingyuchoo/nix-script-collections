with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "node";
    buildInputs = [
        yarn
        nodejs-16_x
    ];
    shellHook = ''
        export PATH="$PWD/node_modules/.bin:$PATH"
        alias run='npm run'
    '';
}
