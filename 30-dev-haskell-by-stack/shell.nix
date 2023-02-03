{ pkg ? import <nixpkgs> {} }: with pkgs;

haskell.lib.buildStackProject {
	name ="<project-name>";
	buildInputs = [
		glpk
		gmp
		pcre
		zlib
	];
}
