{pkgs, ...}: {
  environment.systemPackages = with pkgs; [fmodex supercollider orca-c spotify ardour];
}
