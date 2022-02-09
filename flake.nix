{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
    	url = "github:rycee/home-manager/master";
	inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    };

  outputs =
    { nixpkgs, home-manager, nur, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
        overlays = [
          nur.overlay
        ];
      };
    in
    {
      nixosConfigurations = {
        nixos-desktop = nixpkgs.lib.nixosSystem {
          inherit pkgs system;
          modules = [
            ./hosts/nixos-desktop # import hardware config and system wide configs
            ./modules/alacritty
            ./modules/firefox
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.kirin = import ./modules/packages.nix; # import user level config for packages
            }
          ];
        };
      };
    };
}
