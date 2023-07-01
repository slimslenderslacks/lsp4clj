{
  description = "lps4clj";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:

    flake-utils.lib.eachDefaultSystem
      (system:
        let
          overlays = [
          ];
          # don't treat pkgs as meaning nixpkgs - treat it as all packages!
          pkgs = import nixpkgs {
            inherit overlays system;
          };
        in
        {
          devShells.default = pkgs.mkShell {
            name = "lsp4clj";
            packages = with pkgs; [ babashka clojure ];
          };
        });
}
