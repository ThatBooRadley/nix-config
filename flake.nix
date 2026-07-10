{
  description = "Nix Config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;

      config = {allowUnfree = true;};
    };
  in {
    nixosConfigurations = {
      PC-Config = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
          inherit self;
        };

        modules = [
          nvf.nixosModules.default
          ./nixos/hosts/pc/configuration.nix
          ./nixos/roles/git.nix
          ./nixos/roles/coding.nix
          ./nixos/roles/gaming.nix
          ./nixos/roles/media.nix
          ./nixos/roles/online.nix
          ./nixos/roles/music.nix
          ./nixos/roles/wallpapers.nix
          ./nixos/roles/process-manager.nix
          ./nixos/roles/text-edit.nix
        ];
      };

      Laptop-Config = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
          inherit self;
        };

        modules = [
          nvf.nixosModules.default
          ./nixos/hosts/laptop/configuration.nix
          ./nixos/roles/git.nix
          ./nixos/roles/coding.nix
          ./nixos/roles/gaming.nix
          ./nixos/roles/media.nix
          ./nixos/roles/online.nix
          ./nixos/roles/music.nix
          ./nixos/roles/wallpapers.nix
          ./nixos/roles/process-manager.nix
          ./nixos/roles/text-edit.nix
        ];
      };
    };
  };
}
