{
  description = "NixOS main flake";
	
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, noctalia, ...}: {
    nixosConfigurations.bixos-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./roles/window.nix
        ./roles/editor.nix
	./roles/terminal.nix
        ./configuration.nix
	noctalia.nixosModules.default
      ];
    };
  };
}
