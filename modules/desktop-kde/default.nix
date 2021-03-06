{ config, pkgs, lib, ... }:

{
  services.xserver = {
    desktopManager.plasma5 = {
      enable = true;
      runUsingSystemd = true;
    };
    displayManager.autoLogin =
      let
        my-users = builtins.attrNames (pkgs.lib.filterAttrs (name: value: value.isNormalUser == true) config.users.users);
      in
      {
        enable = false;
      };
  };

  environment.systemPackages = with pkgs; [
    # Themes
    libsForQt5.lightly
    libsForQt5.sierrabreezeenhanced
    libsForQt5.reversal-kde
    yaru-theme

    # Extend
    libsForQt5.bismuth
    libsForQt5.plasma-pa
    libsForQt5.ark
    libsForQt5.ffmpegthumbs
    libsForQt5.kdegraphics-thumbnailers
    libsForQt5.filelight
    libsForQt5.gwenview
    libsForQt5.kcolorchooser
    caffeine-ng
    libsForQt5.kwin-forceblur
    pkgs.libsForQt5.kwalletmanager
  ];

}
