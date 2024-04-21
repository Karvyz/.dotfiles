{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      orion = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [ ./hosts/orion.nix ];
      };
    
      polaris = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [ ./hosts/polaris.nix ];
      };
    };
    
    homeConfigurations.karviz = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      modules = [ ./modules/home ];
    };
  };
}
