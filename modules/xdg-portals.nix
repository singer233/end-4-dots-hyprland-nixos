illogical-impulse-dotfiles: inputs: { config, lib, pkgs, ... }:
let
  enabled = config.illogical-impulse.enable;
in
{
  config = lib.mkIf enabled {
   xdg.portal = {
    enable = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common.default = [ "hyprland" "kde" "gtk" ];
      };
  };
};
}

