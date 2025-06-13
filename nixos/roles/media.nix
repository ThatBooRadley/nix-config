{pkgs, ...}: {
  environment.systemPackages = with pkgs; [pixelorama jellyfin-media-player tailscale];
  services.tailscale.enable = true;
}
