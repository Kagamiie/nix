{ config, pkgs, ... }:

{
  # Mandatory Access Control
  security.apparmor = {
    enable = true;
    killUnconfinedConfinables = true;
  };

  # Kernel security parameters
  boot.kernel.sysctl = {
    "kernel.dmesg_restrict" = 1;        # Restrict dmesg access
    "kernel.kptr_restrict" = 2;         # Hide kernel pointers
    "kernel.sysrq" = 0;                 # Disable SysRq key
    "net.core.bpf_jit_harden" = 2;      # Harden BPF JIT compiler
  };
}
