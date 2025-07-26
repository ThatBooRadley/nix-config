{pkgs, ...}: {
  environment.systemPackages = with pkgs; [spotify alsa-scarlett-gui helvum nuclear];

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
      wireplumber = {
        enable = true;
        package = pkgs.wireplumber;
      };
    };
    pulseaudio.enable = false;
  };
}
