{pkgs, ...}: {
  environment.systemPackages = with pkgs; [czkawka resources bottles];
  services.udisks2.enable = true;
}
