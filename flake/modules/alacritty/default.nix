{ config, pkgs, lib, colorscheme, ... }:
let
  config = { colors }:
    {
      env = {
        "TERM" = "xterm-256color";
      };

      background_opacity = 0.9;

      window = {
        padding = { x = 10; y = 10; };
        dynamic_padding = false;
        dynamic_title = true;
      };

      font = {
        size = 12;

        normal.family = "Hack Nerd Font Mono";
        normal.style = "Regular";
        bold.family = "Hack Nerd Font Mono";
        bold.style = "Bold";
        italic.family = "Hack Nerd Font Mono";
        italic.style = "Italic";
        bold_italic.family = "Hack Nerd Font Mono";
        bold_italic.style = "Bold Italic";
      };

      cursor = {
        style = "Beam";
        unfocused_hollow = true;
      };

      shell = {
        program = "/bin/zsh";
      };

      key_bindings = [
        { key = "Up"; mods = "Alt"; chars = "\x1b[1;5A"; }
        { key = "Down"; mods = "Alt"; chars = "\x1b[1;5B"; }
        { key = "Left"; mods = "Alt"; chars = "\x1bb"; }
        { key = "Right"; mods = "Alt"; chars = "\x1bf"; }
      ];
    };
in
{
  programs.alacritty = {
    enable = true;
  };
}
