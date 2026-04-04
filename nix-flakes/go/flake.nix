{
  description = "Go development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in
    {
      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = with pkgs; [
          go
          gosec
          gotools
        ];

        shellHook = ''
          # Set Go environment variables
          export GOPATH="$HOME/go"
          export GOBIN="$GOPATH/bin"
          export PATH="$GOBIN:$PATH"
        '';
      };
    };
}
