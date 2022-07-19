{ config, pkgs, ... }:
{
  # Enable Gnome
  services.xserver.desktopManager.gnome.enable = true;

  # Exclude unneeded GNOME apps
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
      cheese # webcam tool
      gnome-music
      gedit # text editor
      epiphany # web browser
      geary # email reader
      evince # document viewer
      totem # video player
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
  ]);
}
