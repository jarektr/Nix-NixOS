{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./configs/config.nix
    ./pkgs/pkgs.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Define hostname
  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set time zone.
  time.timeZone = "America/Denver";

  # Set internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Enable X11
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable gdm
  services.xserver.displayManager.gdm.enable = true;
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # System State
  system.stateVersion = "22.05";
}
