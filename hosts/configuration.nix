
{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      # Spicetify
      inputs.spicetify-nix.nixosModules.default
      # Flatpak
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];


  # Zen Kernel
  boot = {
    # Kernel
    kernelPackages = pkgs.linuxPackages_zen;
    # This is for OBS Virtual Cam Support
    kernelModules = [ "v4l2loopback" ];
    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    # Needed For Some Steam Games
    kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
    };
    # Make /tmp a tmpfs
    tmp = {
      useTmpfs = false;
      tmpfsSize = "30%";
    };
    # Appimage Support
    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
      magicOrExtension = ''\x7fELF....AI\x02'';
    };
    plymouth.enable = true;
  }; 


# Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # Hostname
  networking.hostName = "nixos-main";


  # Enable networking
  networking.networkmanager.enable = true;


  # Set your time zone.
  time.timeZone = "Europe/Rome";


  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true; 


  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
    	proton-ge-bin
    ];
  };


  # Openrazer
  hardware.openrazer.enable = true;
  environment.systemPackages = with pkgs; [
      openrazer-daemon
      polychromatic 
  ];


  # Gamemode
  programs.gamemode.enable = true;


  # Flatpak
  services.flatpak.enable = true;
  services.flatpak.packages = [
     "com.github.tchx84.Flatseal"
     "sh.ppy.osu"
     "org.freedesktop.Platform.GL.nvidia-565-57-01"
     "org.freedesktop.Platform.GL32.nvidia-565-57-01" 
     { flatpakref = "https://sober.vinegarhq.org/sober.flatpakref"; sha256="1pj8y1xhiwgbnhrr3yr3ybpfis9slrl73i0b1lc9q89vhip6ym2l"; } # to take sha i have to do "nix-prefetch-url <url>" and then copy the print
  ];


  # Home manager
  home-manager = {
  	extraSpecialArgs = { inherit inputs;};
  	users = {
  		"user" = import ./home.nix;
  	};
  };


  # DBus
  services.dbus.enable = true;


  # AutoMount ExternalDisk
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true; 


  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };


  # Enable the X11 windowing system.
  services.xserver.enable = false; 


  # Hyprland
  nix.settings = {
	substituters = ["https://hyprland.cachix.org"];
	trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  programs.hyprland.enable = true;


  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    comfortaa
    noto-fonts-cjk-sans
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono 
  ];


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  # Disks
  fileSystems."/drives/Volume" = {
    device = "/dev/sda1";
  };



  # Enable CUPS to print documents.
  services.printing.enable = true;


  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "User";
    extraGroups = [ "networkmanager" "wheel" "openrazer" ];
  };


  # Install nvidia drivers
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.kernelParams = ["nvidia_drm.modeset=1"];
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true; 
  hardware.pulseaudio.support32Bit = true;
  hardware.nvidia = { 
	package = config.boot.kernelPackages.nvidiaPackages.beta;
  	open = false;
	modesetting.enable = true;
	nvidiaSettings = true;
	powerManagement.enable = false;
    powerManagement.finegrained = false;
  };


  # System version
  system.stateVersion = "24.05";

}
