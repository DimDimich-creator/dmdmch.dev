{
  description = "Minimal flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... }: let
    system = builtins.currentSystem;

    in {
      devShells."${system}".default = let
        pkgs = import nixpkgs {
          inherit system;
        };

      in pkgs.mkShell {
        packages = with pkgs; [
          openssl
          pkg-config
          # ts
          nodejs_22
          pnpm_9
          bun
          graphite-cli
          git
          toybox
        ];
        };
    };
}