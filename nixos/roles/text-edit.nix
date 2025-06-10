{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    novelwriter
    obsidian # i have to use this for a project
  ];
}
