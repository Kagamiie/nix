{
  description = "Personal & Minimal NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      ks-nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        
        modules = [ ./nixos/configuration.nix ];
      };
    };

    homeConfigurations = {
      "ks@ks-nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        
        modules = [ ./home-manager/home.nix ];
      };
    };
  };
}
