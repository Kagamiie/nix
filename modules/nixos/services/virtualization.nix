{ config, pkgs, lib, ... }:

let
  cfg = config.systemProfiles.virtualization;
in
{
  options.systemProfiles.virtualization = {
    libvirt.enable = lib.mkEnableOption "QEMU/KVM via libvirtd and virt-manager";
    docker.enable = lib.mkEnableOption "Docker daemon";
    vmware.enable = lib.mkEnableOption "VMware Workstation host";
    virtualbox.enable = lib.mkEnableOption "VirtualBox host";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.libvirt.enable {
      virtualisation.libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          swtpm.enable = true;
        };
      };
      programs.virt-manager.enable = true;
      users.users.ks.extraGroups = [ "libvirtd" ];
    })

    (lib.mkIf cfg.docker.enable {
      virtualisation.docker.enable = true;
    })

    (lib.mkIf cfg.vmware.enable {
      virtualisation.vmware.host.enable = true;
    })

    (lib.mkIf cfg.virtualbox.enable {
      virtualisation.virtualbox.host.enable = true;
      users.users.ks.extraGroups = [ "vboxusers" ];
    })
  ];
}
