{
  description = "NixOS main flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.bixos-desktop = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./roles/git.nix
          ./roles/window.nix
          ./roles/editor.nix
          ./roles/terminal.nix
          ./roles/spotify.nix
          ./roles/grub.nix
          ./configuration.nix
          inputs.noctalia.nixosModules.default
          inputs.noctalia-greeter.nixosModules.default
          inputs.nvf.nixosModules.default
        ];
      };
    };
}
