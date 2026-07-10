{pkgs, ...}: {
  environment.systemPackages = with pkgs; [czkawka resources bottles mediawriter];
  services.udisks2.enable = true;
}
