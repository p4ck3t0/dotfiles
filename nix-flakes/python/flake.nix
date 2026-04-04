{
  description = "Kubernetes tools";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      gke-auth = pkgs.google-cloud-sdk.withExtraComponents [
        pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin
      ];
    in
    {
      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = with pkgs; [
            pipenv
            pyenv
        ];
      };
    };
}
