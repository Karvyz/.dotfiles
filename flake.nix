{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      stylix,
      ...
    }@inputs:
    let
      mkSystem =
        hostname:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            (./hosts + "/${hostname}")
            ./system
            ./themes
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
          ];
        };
    in
    {
      nixosConfigurations = {
        orion = mkSystem "orion";
        polaris = mkSystem "polaris";
        ruin = mkSystem "ruin";
      };

      # homeConfigurations.karviz = home-manager.lib.homeManagerConfiguration {
      #   pkgs = import nixpkgs { system = "x86_64-linux"; };
      #   extraSpecialArgs = {
      #     inherit inputs;
      #   };
      #   modules = [
      #     ./home
      #     stylix.homeManagerModules.stylix
      #     # nixvim.homeManagerModules.nixvim
      #   ];
      # };
    };
}
