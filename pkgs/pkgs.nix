{ config, pkgs, ... }:
{
    imports = [
      ./python.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Packages installed in system profile
  environment.systemPackages = with pkgs; [
      microsoft-edge
      neovim
      vim
      wget
  ];

}
