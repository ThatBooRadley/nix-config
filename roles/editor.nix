{config, ...}:

{
  #environment.systemPackages = with pkgs; [];

  programs.neovim = {
    enable = true;
  };
  
  programs.git.enable = true;
}
