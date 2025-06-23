{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    novelwriter
    peazip
    obsidian # i have to use this for a project
  ];
}
