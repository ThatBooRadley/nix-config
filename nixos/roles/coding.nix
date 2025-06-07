{ self, pkgs, ... }:
let
  forest = pkgs.vimUtils.buildVimPlugin {
    name = "forest.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "Skullamoris";
      repo = "forest.nvim";
hash = "bac501d971512e73cc80e5895c849290e0c297bf";
    };
  };
in {
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
          lsp.enable = true;
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
          startPlugins = [ forest ];
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
