{config, ...}:

{
  programs.nvf = {
		enable = true;
		settings = {
			vim = {
				autocomplete.blink-cmp = {
					enable = true;
					friendly-snippets.enable = true;
					sourcePlugins = {
						ripgrep.enable = true;
						spell.enable = true;
					};
				};
				binds.whichKey.enable = true;
				clipboard.enable = true;
				diagnostics = {
					enable = true;
					nvim-lint.enable = true;
				};
				filetree.nvimTree = {
					enable = true;
					mappings = {
						findFile = "<leader>eg";
						focus = "<leader>ef";
						refresh = "<leader>er";
						toggle = "<leader>e";
					};
				};
				formatter.conform-nvim = {
					enable = true;
					presets.prettier.enable = true;
				};
				fzf-lua.enable = true;
				git.enable = true;
				languages = {
					nix.enable = true;
          nu.enable = true;
					rust.enable = true;
					toml.enable = true;
					clang.enable = true;
					java.enable = true;
				};
				lsp = {
					enable = true;
					formatOnSave = true;
					inlayHints.enable = true;
					null-ls.enable = true;
					nvim-docs-view.enable = true;
					trouble.enable = true;
				};
				minimap.codewindow.enable = true;
				options = {
					shiftwidth = 2;
					tabstop = 2;
				};
				presence.neocord.enable = true;
				spellcheck = {
					enable = true;
					programmingWordlist.enable = true;
				};
				statusline.lualine.enable = true;
				syntaxHighlighting = true;
				theme = {
					enable = true;
					name = "catppuccin";
					style = "auto";
				};
				treesitter = {
					enable = true;
					context.enable = true;
				};
				ui = {
					colorizer.enable = true;
					illuminate.enable = true;
					noice.enable = true;
				};
				utility.icon-picker.enable = true;
				visuals ={
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
