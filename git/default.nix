{ pkgs ? import <nixpkgs> {} }:

with pkgs.lib;

(pkgs.callPackage ../mkPresentation.nix) {
  src = ./.;
  name = "git";
}
