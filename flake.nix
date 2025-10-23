{
  description = "Altay MA analysis env";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        python = pkgs.python312;
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            python
            uv
            just
            pandoc
          ];
          
         shellHook = ''
            echo "Altay MA analysis environment loaded"
            echo "Installing dependencies..."
            just install
            echo "Exporting analysis..."
            just export
            echo "Ready! Analysis.html has been generated."
          '';
        };
      }
    );
}