inputs: { config, lib, pkgs, ... }:
let
  cfg = config.illogical-impulse;
  selfPkgs = import ../pkgs {
    inherit pkgs;
  };
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # # AUDIO #
      cava
      lxqt.pavucontrol-qt
      wireplumber
      libdbusmenu-gtk3
      playerctl

      # # BACK LIGNT#
      brightnessctl
      ddcutil

      # # BASIC #
      axel
      bc
      # coreutils
      cliphist
      # cmake
      curl
      rsync
      wget
      libqalculate
      ripgrep
      jq
      # meson
      fish
      foot
      fuzzel
      matugen
      mpv
      mpvpaper

      xdg-user-dirs

      # # FONT THEMES #
      adw-gtk3
      #   breeze-plus #TODO need monaula install
      eza
      darkly
      #   fish
      #   fontconfig
      python313Packages.kde-material-you-colors
      #   kitty
      #   matugen
      #   starship
      #   # ttf-readex-pro #TODO need monaula install
      #   # ttf-jetbrains-mono-nerd
      material-symbols
      rubik
      inputs.nur.legacyPackages."${system}".repos.skiletro.gabarito
      selfPkgs.illogical-impulse-oneui4-icons
      # # HYPRLAND #
      wl-clipboard

      # # KDE #
      kdePackages.bluedevil
      gnome-keyring
      # xdg-desktop-portal-kde # in config 
      # networkmanager # normal handel with nixos services
      kdePackages.plasma-nm
      kdePackages.plasma-workspace  # for plasma-apply-color-scheme
      kdePackages.polkit-kde-agent-1
      kdePackages.dolphin
      kdePackages.breeze
      # # SCREEN CAPUTUER #
      swappy
      wf-recorder
      hyprshot
      tesseract
      slurp

      # # TOOLKIT #
      upower
      wtype
      ydotool

      # # PYTHON #
      #   # clang
      # uv
      #   gtk4
      #   libadwaita
      libsoup_3
      libportal-gtk4
      gobject-introspection
      sassc
      opencv
      (python3.withPackages (python-pkgs: with python-pkgs; [
        build
        pillow
        setuptools-scm
        wheel
        pywayland
        psutil
        materialyoucolor
        libsass
        material-color-utilities
        setproctitle
      ]))


      # # WIDGETS #
      glib
      #swww
      translate-shell
      wlogout
      # # hyprland staff # #
      hyprsunset
    ] ++ (with pkgs.nerd-fonts; [
      # nerd fonts
      ubuntu
      ubuntu-mono
      jetbrains-mono
      caskaydia-cove
      fantasque-sans-mono
      mononoki
      space-mono
    ]);

    services.network-manager-applet.enable = true;
  };

}
