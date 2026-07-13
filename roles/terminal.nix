{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    alacritty
    nushell
    zellij
    mediainfo
    ouch
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
  ];

  programs.yazi = {
    enable = true;
    settings = {
      yazi = {
        mgr = {
          show_hidden = true;
          linemode = "size"; 
        };
        plugin = {
          prepend_fetchers = [
            {url = "*"; run = "git"; group = "git";} #git
            {url = "*/"; run = "git"; group = "git";} #git
          ];
          prepend_preloaders = [
            {mime = "{audio,video,image}/*"; run = "mediainfo";} #mediainfo
            {mime = "application/subrip"; run = "mediainfo";} #mediainfo
          ];
          prepend_previewers = [
            {mime = "{audio,video,image}/*"; run = "mediainfo";} #mediainfo
            {mime = "application/subrip"; run = "mediainfo";} #mediainfo
            {mime = "application/{*zip,tar,bzip2,7z*,rar,xz,zstd,java-archive}"; run = "ouch";} #ouch
          ];
        };
        tasks.image_alloc = 1024*1024*1024;
      };
      keymap.mgr = {
        prepend_keymap = [
          {on = "y"; run = ["yank" "plugin clipboard -- --action=copy"];} #clipboard
          {on = ["c" "a" "a"]; run = "plugin compress"; desc = "Archive selected files";} #compress
          {on = "M"; run = "plugin mount";} #mount
          {on = ["." "s"]; run = "plugin what-size"; desc = "Calc size of selection or cwd";} #what-size
          {on = "o"; run = "plugin confirm-open"; desc = "Open selected files";} #confirm-open
          {on = "<Enter>"; run = "plugin confirm-open"; desc = "Open selected files";} #confirm-open
        ];
      };
    };
    plugins = {
      inherit (pkgs.yaziPlugins) clipboard compress full-border git mount mediainfo ouch starship;
      what-size = pkgs.fetchFromGitHub {
        owner = "pirafrank";
        repo = "what-size.yazi";
        rev = "179ebf69c9c3ade40cacc0f25e9557a43427c6ca";
        sha256 = "7q/45TopqbojNRvYDmP9+hgSGPmiyLHBcV051qpOB2Y=";
      };
      confirm-open = pkgs.fetchFromGitHub {
        owner = "walldmtd";
        repo = "confirm-open.yazi";
        rev = "058b9166fb4279fa5fcf5f11d3883bd94c3c937d";
        sha256 = "AvY7O5XKD0M0W6bd9ah3aY4wj32E910uCYSFrkmxZoo=";
      };
    };
    initLua = pkgs.writeText "init.lua" ''
      require("full-border"):setup {
        type = ui.Border.ROUNDED,
      }
      require("git"):setup {
        order = 1500,
      }
      require("starship"):setup()
      require("confirm-open"):setup({
        threshold = 2 -- Change as desired
      })
    '';
  };

  programs.starship = {
    enable = true;
  };
}
