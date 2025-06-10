{pkgs, ...}: {
  environment.systemPackages = with pkgs; [supercollider orca-c spotify ardour];
}
