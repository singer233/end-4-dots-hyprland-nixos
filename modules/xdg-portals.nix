illogical-impulse-dotfiles: inputs: { config, lib, pkgs, ... }:
let
  enabled = config.illogical-impulse.enable;
  hypr-xdg = config.illogical-impulse.hyprland.xdgPortalPackage;
in
{
  config = lib.mkIf enabled {
   xdg.portal = {
    enable = true;

    extraPortals = [
      hypr-xdg
      pkgs.kdePackages.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common.default = [ "hyprland" "kde" "gtk" ];
      };
  };
};
}

