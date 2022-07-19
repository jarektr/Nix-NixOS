{ config, ... }:
{
  # Define user account, set password with ‘passwd’
  users.users.jarek = {
    isNormalUser = true;
    description = "jarek";
    passwd = "188127";
    extraGroups = [ "networkmanager" "wheel" ];
  };  
}
