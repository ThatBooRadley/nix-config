{pkgs, ...}: {
  environment.systemPackages = with pkgs; [supercollider foxdot spotify ardour];
}
