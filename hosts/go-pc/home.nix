{ config, pkgs, modulesPath, ... }:

{

  imports =
    [
      ../../modules/go-pc/home/gnome/gtk.nix 
      ../../modules/go-pc/home/spicetify.nix 
    ];

  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "24.05"; 
  nixpkgs.config.allowUnfree = true;


  home.packages = with pkgs; [

	# Fetch Me
	fastfetch
	neofetch

	# System
	eza
	vscode
	htop
	tldr
	git
	onlyoffice-desktopeditors
	unrar

	# Browser and Social
	firefox
	vesktop

	# Music and Video	
	vlc

	# Games
	lunar-client

	# Wine
	winetricks
	wineWowPackages.waylandFull

  ];


  programs.bash = {
  	enable = true;
  	bashrcExtra = ''
	PS1="\[\e[38;5;153;1;2m\] \[\e[39m\] \[\e[38;5;153m\]User\[\e[39m\] \[\e[38;5;153m\]\W\[\e[39m\] \[\e[0m\] "
  	'';
  	shellAliases = {
  		nixr = "sudo nixos-rebuild switch --flake ~/.nixos#go-pc";
  		nixc = "sudo nvim ~/.nixos/hosts/go-pc/configuration.nix";
  		homec = "sudo nvim ~/.nixos/hosts/go-pc/home.nix";
  		flakec = "sudo nvim ~/.nixos/flake.nix";
  		nixe = "sudo nix-collect-garbage -d && sudo nixos-rebuild switch --flake ~/.nixos#go-pc";
  		nvim = "sudo nvim";
  		ls = "eza --icons";
  	};
  };

  home.sessionVariables = {
  	EDITOR = "nvim";
  	BROWSER = "firefox";	
  };

  programs.home-manager.enable = true;
  
}
