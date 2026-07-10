{pkgs, ...}: {
  environment.systemPackages = with pkgs; [gabutdm pixelorama jellyfin-media-player tailscale];
  programs.obs-studio.enable = true;
  services.tailscale.enable = true;
}
