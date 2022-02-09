{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./system-config.nix
      ./packages/meta.nix
      ./services.nix
      ./networking.nix
      ./users.nix
    ];

}

