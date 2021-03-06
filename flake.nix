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
    in
    {
      nixosConfigurations = {
        nixos-desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/nixos-desktop # import hardware config and system wide configs
            { nixpkgs.overlays = [ nur.overlay ]; }
            { nixpkgs.config.allowUnfree = true; }
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.kirin.imports = [
                ./modules/packages.nix # import user level config for packages
                ./modules/alacritty
                ./modules/firefox
              ];
            }
          ];
        };
      };
    };
}
