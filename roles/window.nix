{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    rofi
  ];

  programs.niri.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${config.programs.niri.package}/bin/niri-session";
        user = "bailey";
      };
    };
  };
  systemd.user.services.niri.enableDefaultPath = false;

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };
}
