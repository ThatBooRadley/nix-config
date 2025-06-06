{ pkgs, ... }: {
  programs = {
    neovim.enable = true;
    direnv.enable = true;
    yazi = {
      enable = true;
      settings.yazi = {
        mgr.show_hidden = true;
        mgr.linemode = "size";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    nushell
    zellij
    clang
    alacritty
    nerd-fonts.caskaydia-mono
    lorri
    starship
    godot
    neovim-node-client
  ];
  services.lorri.enable = true;

  environment.variables = {
    EDITOR = "nvim";
    BROWSER = "brave";
    TERMINAL = "zellij";
    SHELL = "nu";
  };
  users.defaultUserShell = pkgs.nushell;
}
