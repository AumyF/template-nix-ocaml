{ pkgs ? import <nixpkgs> { } }: pkgs.mkShell {
  buildInputs = [
    pkgs.ocaml
    pkgs.ocamlPackages.findlib
    pkgs.dune_2
    pkgs.ocamlPackages.ocaml-lsp
    pkgs.ocamlPackages.batteries
    pkgs.ocamlPackages.utop
    pkgs.ocamlformat
    pkgs.ocamlPackages.ocamlformat-rpc-lib
  ];
}
