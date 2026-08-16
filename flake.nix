{
  description = "NixOS main flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
          ./roles/music.nix
          ./roles/grub.nix
          ./roles/vpn.nix
          ./roles/webcam.nix
          ./configuration.nix
          inputs.nvf.nixosModules.default
        ];
      };
    };
}
