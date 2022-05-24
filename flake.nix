{
    description            = "Test-runner for nixlang.";
    inputs.nixpkgs.url     = "github:NixOS/nixpkgs/nixpkgs-unstable";
    inputs.flake-utils.url = "github:numtide/flake-utils";

    outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
        let
            pkgs = import nixpkgs { inherit system; };
        in
        {
            packages.nixt = pkgs.callPackage ./default.nix { inherit pkgs; };
            defaultPackage = self.packages.${system}.nixt;
        }
    );
}
