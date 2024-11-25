{ config, pkgs, modulesPath, ... }:

{

  imports =
    [
      ../../modules/main-pc/home/hyprland/hyprland.nix
      ../../modules/main-pc/home/hyprland/ags.nix
      ../../modules/main-pc/home/hyprland/gtk.nix
      ../../modules/main-pc/home/thunar.nix
      ../../modules/main-pc/home/spicetify.nix
      ../../modules/main-pc/home/kitty.nix
      ../../modules/main-pc/home/discord.nix
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
	pavucontrol
	btop
	tldr
	git
	onlyoffice-desktopeditors
	unrar	

	# Browser and Social
	firefox

	# Music and Video
	obs-studio
	pix

	# Games
	heroic	
	mangohud
	lunar-client
	vulkan-tools

	# Editing
	gimp-with-plugins
	upscayl

  ];

  # Set monitors resolution
  wayland.windowManager.hyprland.settings = {
    monitor = "HDMI-A-1,1920x1080@144,0x0,1";
  };

  programs.bash = {
  	enable = true;
  	bashrcExtra = ''
	PS1="\[\e[38;5;153;1;2m\] \[\e[39m\] \[\e[38;5;153m\]User\[\e[39m\] \[\e[38;5;153m\]\W\[\e[39m\] \[\e[0m\] "
  	'';
  	shellAliases = {
  		nixr = "sudo nixos-rebuild switch --flake ~/.nixos#main-pc";
  		nixc = "sudo nvim ~/.nixos/hosts/main-pc/configuration.nix";
  		homec = "sudo nvim ~/.nixos/hosts/main-pc/home.nix";
  		flakec = "sudo nvim ~/.nixos/flake.nix";
  		nixe = "sudo nix-collect-garbage -d && sudo nixos-rebuild switch --flake ~/.nixos#main-pc";
  		nvim = "sudo nvim";
  		ls = "eza --icons";
  	};
  };

  home.sessionVariables = {
  	EDITOR = "nvim";
  	BROWSER = "firefox";
  	GBM_BACKEND = "nvidia-drm";
  	__GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  programs.home-manager.enable = true;
  
}
