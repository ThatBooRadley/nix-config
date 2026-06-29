{pkgs, ...}: {
  environment.systemPackages = with pkgs; [vesktop zoom-us librewolf rustdesk-flutter];
  nixpkgs.config.permittedInsecurePackages = ["qtwebengine-5.15.19"];
}
