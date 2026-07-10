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
  };

  outputs = {self, nixpkgs, noctalia, noctalia-greeter, ...}: {
    nixosConfigurations.bixos-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./roles/git.nix
        ./roles/window.nix
        ./roles/editor.nix
	./roles/terminal.nix
        ./configuration.nix
	noctalia.nixosModules.default
	noctalia-greeter.nixosModules.default
      ];
    };
  };
}
