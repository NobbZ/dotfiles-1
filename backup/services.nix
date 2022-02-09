{
  # Enable Open SSH
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";
  services.openssh.passwordAuthentication = false;
  services.openssh.knownHosts.nib-mac.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICcijUEHVQa8N43LHbJPStQfb1bCxdOGiUXAFVvXRppi j.mckeown@nib.com.au";

  # Enable Nvidia proprietary drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true; 
}
