{ pkgs, ...}: {

  hardware = {
    opengl = {
	enable = true;
	driSupport32Bit = true;
    };
    nvidia = { modesetting.enable = true; };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
	enable = true;
	version = 2;
	device = "nodev";
	efiSupport = true;
	useOSProber = true;
  };

  # Use latest kernel stable available
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Allow the use of non-free drivers
  nixpkgs.config.allowUnfree = true;

  # Allow the use of flakes
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Set garbage collection to 7 days
  nix.gc = {
	automatic = true;
	options = "--delete-older-than 7d";
  };

  nix.allowedUsers = [ "@wheel" "kirin" ];
  nix.autoOptimiseStore = true;
  nix.optimise.automatic = true;

  system = {
	autoUpgrade.enable = true;
	autoUpgrade.allowReboot = true;
	autoUpgrade.dates = "04:30";
	stateVersion = "21.11";
  };

  time.timeZone = "Australia/Brisbane";

}
