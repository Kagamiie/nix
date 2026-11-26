{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.profiles.antigravity;
  agPkgs = inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  options.profiles.antigravity = {
    enable = lib.mkEnableOption "Google Antigravity Base App";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # The standalone Antigravity Base App (command: `antigravity`)
      # Uses `chromium` for /browser agent automation (or swap to `google-chrome` / `brave`)
      (agPkgs.google-antigravity.override {
        browserPkg = chromium;
      })

      # Optional: Antigravity CLI (`agy`)
      agPkgs.google-antigravity-cli

      # Dependencies for session keyring
      libsecret
    ];

    home.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
