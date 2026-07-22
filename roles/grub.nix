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

  fileSystems = {
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
      device = "/dev/disk/by-uuid/BABCBD23BCBCDB59";
      fsType = "ntfs";
      options = [
        "users"
        "nofail"
        "exec"
      ];
    };
    "/mnt/windows/swap" = {
      device = "/dev/disk/by-uuid/E6D8E598D8E566F1";
      fsType = "ntfs";
      options = [
        "users"
        "nofail"
        "exec"
      ];
    };
  };
}
