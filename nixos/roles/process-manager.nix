{pkgs, ...}: {
  environment.systemPackages = with pkgs; [czkawka resources bottles lufus];
  services.udisks2.enable = true;
}
