{
  description = "Efficient, immutable, UTF friendly byte strings with Elixir-style pattern matching for OCaml";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    minttea = {
      url = "github:leostera/minttea";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rio = {
      url = "github:riot-ml/rio";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }:
        let
          inherit (pkgs) ocamlPackages mkShell;
          inherit (ocamlPackages) buildDunePackage;
          name = "bytestring";
          version = "0.0.9+dev";
        in
          {
            devShells = {
              default = mkShell {
                buildInputs = with ocamlPackages; [
                  dune_3
                  ocaml
                  utop
                  ocamlformat
                ];
                inputsFrom = [ self'.packages.default ];
                packages = builtins.attrValues {
                  inherit (ocamlPackages) ocaml-lsp ocamlformat-rpc-lib;
                };
              };
            };

            packages = {
              default = buildDunePackage {
                inherit version;
                pname = name;
                propagatedBuildInputs = with ocamlPackages; [
                  inputs'.rio.packages.default
                  ppxlib
                  qcheck
                  sedlex
                  inputs'.minttea.packages.spices
                ];
                src = ./.;
              };
            };
          };
    };
}
