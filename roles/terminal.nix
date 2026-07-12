{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    alacritty
    nushell
    zellij
    mediainfo
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
          prepend_keymap = [
            {on = ["y"]; run = ["yank" "plugin clipboard -- --action=copy"];} #clipboard
            {on = ["c" "a" "a"]; run = "plugin compress"; desc = "Archive selected files";} #compress
            {on = ["M"]; run = "plugin mount";} #mount
            {on = ["R" "b"]; run = "plugin recycle-bin";} #recycle-bin
          ];
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
    };
    plugins = {
      inherit (pkgs.yaziPlugins) clipboard compress full-border git mount mediainfo ouch starship;
      # localsend = pkgs."https://github.com/pakhromov/localsend.yazi";
    };
    initLua = pkgs.writeText "init.lua" ''
      require("full-border"):setup {
        type = ui.Border.ROUNDED,
      }
      require("git"):setup {
        order = 1500,
      }
      require("starship"):setup()
    '';
  };

  programs.starship = {
    enable = true;
  };
}
