{
  description = "A very basic flake";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system}; in
      rec {
        packages = flake-utils.lib.flattenTree
          {
            mini-ocaml = pkgs.callPackage ./default.nix { };
          };
        defaultPackage = packages.mini-ocaml;
        apps.mini-ocaml = flake-utils.lib.mkApp { drv = packages.mini-ocaml; };
        defaultApp = apps.mini-ocaml;
        devShell = pkgs.callPackage ./shell.nix { };
      }
    );
}
