{ config, pkgs, ... }: {
    # import system wide configs here
  imports = [
    ./hardware-configuration.nix
  ];

  users = {
    defaultUserShell = pkgs.zsh;
    users.kirin = {
      uid = 1000;
      isNormalUser = true;
      hashedPassword = "$6$0PD3hk827ivtjHE9$p9Xqs5/BD98aa0YKbN2mbp06b5w83vr2HdqmWS7sMcn36zrGh6Kinc5XxihZvPEAGmm95N5LOUnfnWwiNQou91";
      extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" ];
    };
  };

  hardware = {
      opengl = {
       enable = true;
       driSupport32Bit = true;
      };
    nvidia = { modesetting.enable = true; };
  };

  # Enable Nvidia proprietary drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable Open SSH
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";
  services.openssh.passwordAuthentication = false;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
	enable = true;
	version = 2;
	device = "nodev";
	efiSupport = true;
	useOSProber = true; # Looks for other OS's
    gfxmodeEfi = "3440x1440"; # Gives proper resolution
    theme = pkgs.nixos-grub2-theme;
  };

  # Use latest kernel stable available
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking = {
    hostName = "nixos-desktop";
    firewall = {
        enable = true;
        allowedTCPPorts = [ 22 ];
    };
    networkmanager.enable = true;
    useDHCP = false;
  };

  time.timeZone = "Australia/Brisbane";

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true; 
  security.rtkit.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  nix = {
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
    trustedUsers = [ "kirin" "root" ];
    allowedUsers = [ "@wheel" "kirin" ];

    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  system.stateVersion = "22.05";
}
