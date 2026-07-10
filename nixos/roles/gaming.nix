{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };
  environment.systemPackages = with pkgs; [prismlauncher protonup-ng];
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/baileyb/.steam/root/compatibilitytools.d";
  };
}
