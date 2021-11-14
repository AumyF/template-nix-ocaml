{ pkgs ? import <nixpkgs> { } }: pkgs.mkShell {
  buildInputs = [
    pkgs.dune_2
    pkgs.inotify-tools # Enables `dune build -w`
    pkgs.ocaml
    pkgs.ocamlformat
    pkgs.ocamlPackages.findlib
    pkgs.ocamlPackages.ocamlformat-rpc-lib
    pkgs.ocamlPackages.ocaml-lsp
    pkgs.ocamlPackages.utop

    # External packages
    pkgs.ocamlPackages.batteries
  ];
}
