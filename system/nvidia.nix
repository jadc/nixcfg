# To support nVidia dedicated graphics
{ config, pkgs, ... }:

{
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    boot.kernelParams = [ "nvidia-drm.modeset=1" ];
    hardware.nvidia = {
        modesetting.enable = true;
        nvidiaSettings = true;
        open = false;

        # Use beta channel
        package = config.boot.kernelPackages.nvidiaPackages.beta;
    };

    programs.gamemode = {
        enable = true;
        settings = {
            general.inhibit_screensaver = 0;
        };
    };
    users.users.${config.common.username}.extraGroups = [ "gamemode" ];
}
