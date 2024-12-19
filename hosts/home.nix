{ config, pkgs, modulesPath, ... }:

{

  imports =
    [
      ../modules/hyprland/hyprland.nix
      ../modules/hyprland/ags.nix
      ../modules/hyprland/gtk.nix
      ../modules/hyprland/scripts.nix
      ../modules/hyprland/nwg.nix
      ../modules/spicetify.nix
      ../modules/kitty.nix
      ../modules/discord.nix
    ];

  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "24.05"; 
  nixpkgs.config.allowUnfree = true;


  home.packages = with pkgs; [

	# Fetch Me
	fastfetch
	neofetch
	pfetch

	# System
	eza	
	pavucontrol
	btop
	tldr
	git
	onlyoffice-desktopeditors
	unrar
	p7zip
	wf-recorder	

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

	# Coding
	neovim	
	vscode
	zed-editor	

  ];

  # Set monitors resolution
  wayland.windowManager.hyprland.settings = {
    monitor = "HDMI-A-1,1920x1080@144,0x0,1";
  };

  programs.bash = {
  	enable = true;
  	bashrcExtra = ''
	PS1="\[\e[38;5;153;1;2m\] \[\e[39m\] \[\e[38;5;153m\]User\[\e[39m\] \[\e[38;5;153m\]\W\[\e[39m\] \[\e[0m\] "

	if [[ "$(tty)" == "/dev/tty1" ]]
	  then
	    dbus-run-session Hyprland
	  fi

	'';
  	shellAliases = {
  		nixr = "sudo nixos-rebuild switch --flake ~/.nixos#main-pc";
  		nixc = "sudo nvim ~/.nixos/hosts/configuration.nix";
  		homec = "sudo nvim ~/.nixos/hosts/home.nix";
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
