{ pkgs ? import <nixpkgs> { } }: pkgs.ocamlPackages.buildDunePackage {
  pname = "example";
  version = "0.1.0";
  useDune2 = true;
  src =
    ./.;
  nativeBuildInputs = [
    pkgs.ocamlPackages.batteries
    pkgs.ocamlPackages.alcotest
  ];
}
