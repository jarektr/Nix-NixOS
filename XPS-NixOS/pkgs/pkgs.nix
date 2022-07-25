{ config, pkgs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Packages installed in system profile
  environment.systemPackages = with pkgs; [
      git
      git-lfs
      microsoft-edge
      neovim
      python310
      python310Packages.pip
      vim
      wget
  ];
}
