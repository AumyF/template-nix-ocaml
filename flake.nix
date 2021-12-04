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
            example = pkgs.callPackage ./default.nix { };
          };
        defaultPackage = packages.example;
        apps.example = flake-utils.lib.mkApp { drv = packages.example; };
        defaultApp = apps.example;
        devShell = pkgs.callPackage ./shell.nix { };
      }
    );
}
