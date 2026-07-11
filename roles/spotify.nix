{config, ...}:

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
}
