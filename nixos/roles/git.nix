{pkgs, ...}: {
  programs.git = {enable = true;};
  services.forgejo.enable = true;
  environment.systemPackages = with pkgs; [gh];
}
