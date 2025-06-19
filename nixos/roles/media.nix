{pkgs, ...}: {
  environment.systemPackages = with pkgs; [gabutdm libsForQt5.kdenlive pixelorama jellyfin-media-player tailscale];
  programs.obs-studio.enable = true;
  services.tailscale.enable = true;
}
