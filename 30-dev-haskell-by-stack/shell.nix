{ pkg ? import <nixpkgs> {} }: with pkgs;

haskell.lib.buildStackProject {
	name ="<project-name>";
	buildInputs = [
		zlib
		glpk
		pcre
	];
}
