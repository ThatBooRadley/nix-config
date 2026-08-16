{ ... }:
{
  #environment.systemPackages = with pkgs; [
  #  jellyfin-desktop
  #];

  services.tailscale.enable = true;
  #networking.wg-quick.interfaces.cc0.configFile = "~/.local/share/wireguard/cc0.conf";

}
