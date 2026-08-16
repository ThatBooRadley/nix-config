{ pkgs, ... }:

{
  networking.firewall.allowedTCPPorts = [ 57621 ];
  networking.firewall.allowedUDPPorts = [ 5353 ];

  environment.systemPackages = with pkgs; [
    playerctl
    cliamp
  ];
}
