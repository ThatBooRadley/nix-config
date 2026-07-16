{ ... }:

{
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  #environment.systemPackages = with pkgs; [];

  programs.niri.enable = true;
  systemd.user.services.niri.enableDefaultPath = false;

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  programs.noctalia-greeter = {
    enable = true;

    settings = {
      default_session = {
        user = "bailey";
        command = "Niri";
      };
    };
  };
}
