{
  description = "Nixos config flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; 

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1"; 

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";
   
    swww.url = "github:LGFae/swww";

  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
    	main-pc = nixpkgs.lib.nixosSystem {
      		specialArgs = {inherit inputs;};
      		modules = [
        		./hosts/configuration.nix
      		];
    	};	
     };
  };
}
