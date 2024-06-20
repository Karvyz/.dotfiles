{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		stylix.url = "github:danth/stylix";
		ags.url = "github:Aylur/ags";
  };

  outputs = { nixpkgs, home-manager, stylix, ags, ... }@inputs: {
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
			extraSpecialArgs = { inherit inputs; };
      modules = [
				./home
				stylix.homeManagerModules.stylix
			];
    };
  };
}
