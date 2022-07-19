{ config, pkgs, ... }:
{
    imports = [
      ./python.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Packages installed in system profile
  environment.systemPackages = with pkgs; [
      git
      git-lfs
      microsoft-edge
      neovim
      vim
      wget
  ];
}
