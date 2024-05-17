{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { nixpkgs, home-manager, nix-colors, ... }@inputs: {
    nixosConfigurations = {
      orion = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [ 
					./hosts/orion
					./system
				];
      };
    
      polaris = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [ 
				./hosts/polaris.nix
				./system
				];
      };
    };
    
    homeConfigurations.karviz = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { system = "x86_64-linux"; };
			extraSpecialArgs = { inherit nix-colors; };
      modules = [ ./home ];
    };
  };
}
