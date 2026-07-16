{ ... }:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        autocomplete = {
          blink-cmp = {
            enable = true;
            friendly-snippets.enable = true;
          };
        };
        binds.whichKey.enable = true;
        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
        };
        diagnostics = {
          enable = true;
          nvim-lint.enable = true;
          presets = {
            checkmake.enable = true;
            deadnix.enable = true;
            dotenv-linter.enable = true;
            taplo.enable = true;
          };
        };
        filetree.neo-tree.enable = true;
        formatter.conform-nvim = {
          #enable = true;
          presets = {
            astyle.enable = true;
            dockerfmt.enable = true;
            nixfmt-rs.enable = true;
            prettier.enable = true;
            rustfmt.enable = true;
            tombi.enable = true;
          };
        };
        git.enable = true;
        keymaps = [
          {
            key = "<leader>e";
            mode = [
              "n"
              "i"
              "v"
            ];
            silent = true;
            action = "<cmd>Neotree toggle<CR>";
          }
          {
            key = "<leader>n";
            mode = [
              "n"
              "i"
              "v"
            ];
            silent = true;
            action = "<cmd>Telescope notify<CR>";
          }
        ];
        languages = {
          enableTreesitter = true;
          clang.enable = true;
          cmake.enable = true;
          java.enable = true;
          markdown.enable = true;
          nix.enable = true;
          nu.enable = true;
          rust = {
            enable = true;
            extensions.crates-nvim.enable = true;
          };
          toml.enable = true;
          yaml.enable = true;
        };
        lsp = {
          enable = true;
          formatOnSave = true;
          inlayHints.enable = true;
          lspsaga.enable = true;
          trouble.enable = true;
        };
        notify.nvim-notify.enable = true;
        options = {
          shiftwidth = 2;
          tabstop = 2;
          wrap = false;
        };
        presence.neocord.enable = true;
        snippets.luasnip.enable = true;
        syntaxHighlighting = true;
        tabline.nvimBufferline.enable = true;
        telescope.enable = true;
        theme = {
          enable = true;
          name = "everforest";
          style = "hard";
          transparent = true;
        };
        ui = {
          breadcrumbs.enable = true;
          illuminate.enable = true;
          modes-nvim.enable = true;
          noice.enable = true;
        };
        utility = {
          csvview.enable = true;
          grug-far-nvim.enable = true;
          nix-develop.enable = true;
          sleuth.enable = true;
        };
        visuals = {
          fidget-nvim.enable = true;
          highlight-undo.enable = true;
          hlargs-nvim.enable = true;
          indent-blankline.enable = true;
          nvim-cursorline.enable = true;
          rainbow-delimiters.enable = true;
        };
      };
    };
  };
}
