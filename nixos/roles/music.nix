{pkgs, ...}: {
  environment.systemPackages = with pkgs; [foxdot spotify ardour];
}
