{config, inputs, pkgs, lib, ...}:

{
  programs.spicetify =
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
  {
    enable = true;
    #enabledCustomApps = [];
    #enabledExtensions = [];
    #enabledSnippets = [];
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  environment.systemPackages = with pkgs; [
    playerctl
  ];
}
