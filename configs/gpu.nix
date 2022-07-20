{ config, pkgs, ... }:
{
  # Intel/Nivida iGPU/eGPU config
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia.prime.sync.allowExternalGpu = true;
  hardware.nvidia.prime.nvidiaBusId = "PCI:46:0:0";
  hardware.nvidia.prime.intelBusId = "PCI:0:2:0";
  hardware.nvidia.prime.offload.enable = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.opengl.enable = true;

  # Set X11 to use Nvidia drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # eGPU specialisation config 
  specialisation = {
    eGPU.configuration = {
      system.nixos.tags = [ "eGPU" ];
      hardware.nvidia.powerManagement.enable = pkgs.lib.mkForce false;
      hardware.nvidia.prime.offload.enable = pkgs.lib.mkForce false;
      hardware.nvidia.modesetting.enable = pkgs.lib.mkForce false;
      services.xserver.config = pkgs.lib.mkOverride 0
      ''
        Section "Module"
          Load           "modesetting"
        EndSection

        Section "Device"
          Identifier     "Device0"
          Driver         "nvidia"
          BusID          "46:0:0"
          Option         "AllowEmptyInitialConfiguration"
          Option         "AllowExternalGpus" "True"
        EndSection
      '';
    };
  };
}
