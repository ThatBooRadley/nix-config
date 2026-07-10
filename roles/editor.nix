{config, pkgs, ...}:

let
  myNeovim = pkgs.neovim.override {
    vimAlias = true;
    viAlias = true;
    configure = {
      customRC = ''
      '';
      packages.myVimPackages = with pkgs.vimPlugins; {
        start = [
          nvim-treesitter.withAllGrammars
	];
	opt = [];
      };
    };
  };
in
{
  environment.systemPackages = with pkgs; [
    myNeovim
  ];
}
