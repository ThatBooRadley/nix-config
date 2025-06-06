{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ jellyfin-media-player tailscale ];
  services.tailscale.enable = true;
}
