{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix/release-24.11";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      stylix,
      nixvim,
      plasma-manager,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        orion = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/orion
            ./home/theme.nix
            ./system
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
          ];
        };

        polaris = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/polaris
            ./home/theme.nix
            ./system
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
          ];
        };

        ruin = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/ruin
            ./home/theme.nix
            ./system
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
          ];
        };

        latitude = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/latitude
            ./home/theme.nix
            ./system
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
          ];
        };
      };

      homeConfigurations.karviz = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./home
          stylix.homeManagerModules.stylix
          nixvim.homeManagerModules.nixvim
        ];
      };
    };
}
