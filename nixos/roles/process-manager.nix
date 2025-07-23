{pkgs, ...}: {
  environment.systemPackages = with pkgs; [czkawka resources];
  virtualisation.virtualbox.host.enable = true;
}
