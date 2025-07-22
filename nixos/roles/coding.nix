{
  #self,
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
          lsp = {
            enable = true;
            formatOnSave = true;
            inlayHints.enable = true;
            lightbulb.enable = true;
            lspconfig.enable = true;
            lspsaga.enable = true;
            null-ls.enable = true;
            #lspSignature.enable = true;
          };
          languages = {
            rust = {
              enable = true;
              crates.enable = true;
              format.enable = true;
              lsp = {
                enable = true;
                opts = ''
                  ['rust-analyzer'] = {
                    cargo = {
                      allFeature = true
                    },
                    checkOnSave = true,
                    procMacro = {
                      enable = true,
                    },

                  },
                '';
              };
            };
            nix.enable = true;
            nu.enable = true;
            markdown = {
              enable = true;
              extensions.markview-nvim.enable = true;
            };
            clang.enable = true;
            java.enable = true;
            yaml.enable = true;
            enableExtraDiagnostics = true;
            enableTreesitter = true;
            enableFormat = true;
          };
          treesitter = {
            highlight.enable = true;
            indent.enable = true;
            incrementalSelection.enable = true;
            textobjects.enable = true;
            #context.enable = true;
          };
          notify.nvim-notify.enable = true;
          options = {
            autoindent = true;
            wrap = false;
          };
          filetree.neo-tree.enable = true;
          statusline.lualine.enable = true;
          autocomplete = {
            #nvim-cmp.enable = true;
            blink-cmp = {
              enable = true;
              friendly-snippets.enable = true;
              sourcePlugins.emoji.enable = true;
              setupOpts = {
                signature.enabled = true;
              };
              sourcePlugins = {
                ripgrep.enable = true;
                spell.enable = true;
              };
            };
            enableSharedCmpSources = true;
          };
          syntaxHighlighting = true;
          utility = {
            preview.markdownPreview.enable = true;
            sleuth.enable = true;
            snacks-nvim.enable = true;
            mkdir.enable = true;
          };
          tabline.nvimBufferline.enable = true;
          visuals = {
            fidget-nvim.enable = true;
            highlight-undo.enable = true;
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
          presence.neocord.enable = true;
          snippets.luasnip.enable = true;
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
    ripgrep
  ];
  services = {
    lorri.enable = true;
  };

  environment.variables = {
    EDITOR = "nvim";
    BROWSER = "floorp";
    TERMINAL = "zellij";
    SHELL = "nu";
  };
  users.defaultUserShell = pkgs.nushell;
}
