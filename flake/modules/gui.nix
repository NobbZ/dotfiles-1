# For a decent GUI you need:
# Window Manager, Compositor, Status Bar, Lockscreen (Display Manager)
{ config, pkgs, lib, ...}:
{
    xsession = {
        enable = true;
    };

    # Window Manager
    services.xserver = {
        windowManager.qtile.enable = true;
        displayManager.lightdm = {
            enable = true;
            greeters.mini = {
                enable = true;
            };
        };
    };

    # Compositor
    services.picom = {
        enable = true;
        experimentalBackends = true;
        blur = true;
    };

    # Puts the qtile config in ~/.config/qtile/config.py so qtile picks it up
    home.file.".config/qtile/config.py".source = ./qtile.py;

    home.packages = with pkgs; [
        i3lock-fancy
        autorandr
        picom
        polybar
        rofi
    ];
}