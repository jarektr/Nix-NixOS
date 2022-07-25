{ config, ... }:
{
  # Define user account, set password with ‘passwd’
  users.users.jarek = {
    isNormalUser = true;
    description = "jarek";
    extraGroups = [ "networkmanager" "wheel" ];
  };  
}
