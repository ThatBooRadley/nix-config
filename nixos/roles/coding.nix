{
  self,
  pkgs,
  ...
}: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    direnv.enable = true;
    yazi = {
      enable = true;
      settings.yazi = {
        mgr.show_hidden = true;
        mgr.linemode = "size";
      };
    };
    nvf = {
      enable = true;
      settings = {
        vim = {
          viAlias = false;
          vimAlias = true;
          lsp = {
            enable = true;
            formatOnSave = true;
            inlayHints.enable = true;
            lspSignature.enable = true;
          };
          languages = {
            rust.enable = true;
            nix.enable = true;
            markdown.enable = true;
            lua.enable = true;
            clang.enable = true;
            enableExtraDiagnostics = true;
            enableTreesitter = true;
            enableFormat = true;
          };
          filetree.neo-tree.enable = true;
          statusline.lualine.enable = true;
          autocomplete.nvim-cmp.enable = true;
          startPlugins = [];
        };
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
    nodejs_24
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
