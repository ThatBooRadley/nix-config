{ ... }:

{
  boot.loader = {
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
  time.hardwareClockInLocalTime = true;

  fileSystems =
    let
      windows = "nvme0n1";
    in
    {
      #"/mnt/windows/boot" = {
      #  device = "/dev/${windows}p1";
      #  fsType = "none";
      #  options = [
      #    "users"
      #    "nofail"
      #    "exec"
      #  ];
      #};
      "/mnt/windows/main" = {
        device = "/dev/${windows}p2";
        fsType = "ntfs";
        options = [
          "users"
          "nofail"
          "exec"
        ];
      };
      "/mnt/windows/swap" = {
        device = "/dev/${windows}p3";
        fsType = "ntfs";
        options = [
          "users"
          "nofail"
          "exec"
        ];
      };
    };
}
