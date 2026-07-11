{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    alacritty
    nushell
    zellij
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
  ];

  programs.yazi = {
    enable = true;
    settings = {
      yazi.mgr.show_hidden = true;
    };
  };
}
