{config, ...}:

{
  programs.git = {
    enable = true;
    config.user = {
      name = "ThatBooRadley";
      email = "bbignall1225@gmail.com";
    };
  };
  environment.systemPackages = with pkgs; [
    gh
  ];
}
