{ config, pkgs, ... }:
{
  # Enable Gnome
  services.xserver.desktopManager.gnome.enable = true;

  # Exclude unneeded GNOME apps
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome-connections
  ]) ++ (with pkgs.gnome; [
      cheese
      gnome-music
      gnome-maps
      gnome-contacts
      gnome-clocks
      gnome-weather
      gnome-calendar
      seahorse
      gedit
      epiphany
      geary
      evince
      totem
      tali
      iagno
      hitori
      atomix
      simple-scan
      yelp
  ]);
}
