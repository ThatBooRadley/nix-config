{ pkgs, ... }: {
  environment.systemPackages = with pkgs;
    [
      obsidian # i have to use this for a project
    ];
}
