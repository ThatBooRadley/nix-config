{pkgs, ...}: {
  environment.systemPackages = with pkgs; [czkawka resources];
}
