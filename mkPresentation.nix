# Nix expression to generate a reveal.js presentation

{ # the nixpkgs set to use
  pkgs
, src
, name
, revealVersion ? "3.5.0"
  # extra dependencies
 ,extraBuildInputs ? []
  # assets to include in the result packages, typically examples
 ,assets ? []
 ,theme ? "league"
}:
let
  revealJS = fetchTarball "https://github.com/hakimel/reveal.js/archive/${revealVersion}.tar.gz";
in

pkgs.stdenv.mkDerivation rec {
  inherit name src;

  preferLocalBuild = true;
  allowSubstitutes = false;

  # dependencies declaration
  buildInputs = with pkgs; [ pandoc ] ++ extraBuildInputs;

  installPhase = ''
    mkdir $out
    for presentation in $(find . -name "*\.md"); do
      id=$(basename $presentation ".md")
      pandoc -V theme=${theme} -t revealjs -s -o $out/"$id".html "$id".md
    done
    ln -s ${revealJS} $out/reveal.js
  '';
}
