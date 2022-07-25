{ config, ... }:
{
  imports = [
    ./gnome.nix
    ./gpu.nix
    ./users.nix
  ];
}
