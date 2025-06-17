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
          treesitter = {
            highlight.enable = true;
            indent.enable = true;
            #context.enable = true;
          };
          notify.nvim-notify.enable = true;
          options.autoindent = true;
          filetree.neo-tree.enable = true;
          statusline.lualine.enable = true;
          autocomplete = {
            nvim-cmp.enable = true;
            #blink-cmp.enable = true;
            enableSharedCmpSources = true;
          };
          syntaxHighlighting = true;
          utility = {
            preview.markdownPreview.enable = true;
            sleuth.enable = true;
            snacks-nvim.enable = true;
          };
          tabline.nvimBufferline.enable = true;
          visuals = {
            fidget-nvim.enable = true;
            indent-blankline.enable = true;
            nvim-cursorline.enable = true;
            nvim-web-devicons.enable = true;
            rainbow-delimiters.enable = true;
          };
          theme = {
            enable = true;
            transparent = true;
            name = "rose-pine";
            style = "main";
          };
          ui = {
            borders.enable = true;
            breadcrumbs.enable = true;
            illuminate.enable = true;
            modes-nvim.enable = true;
          };

          keymaps = [
            {
              key = "<leader>e";
              mode = "n";
              silent = true;
              action = ":Neotree toggle<CR>";
            }
          ];
        };
      };
    };
    nix-ld.enable = true;
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
    codeberg-cli
  ];
  services = {
    lorri.enable = true;
  };

  environment.variables = {
    EDITOR = "nvim";
    BROWSER = "brave";
    TERMINAL = "zellij";
    SHELL = "nu";
  };
  users.defaultUserShell = pkgs.nushell;
}
