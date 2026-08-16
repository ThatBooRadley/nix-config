{ pkgs, ... }:

{
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    cups-pk-helper
  ];

  programs.niri.enable = true;
  systemd.user.services.niri.enableDefaultPath = false;

  programs.dms-shell = {
    enable = true;
    enableSystemMonitoring = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    plugins = {
    };
  };
  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
  };
}
