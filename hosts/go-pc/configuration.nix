{ config, pkgs, inputs, ... }:

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


  # Boot
  boot = {
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
  networking.hostName = "nixos-go";


  # Enable networking
  networking.networkmanager.enable = true;


  # Set your time zone.
  time.timeZone = "Europe/Rome";


  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # Flatpak
  services.flatpak.enable = true;
  services.flatpak.packages = [
     "com.github.tchx84.Flatseal"
     "sh.ppy.osu"
     "net.codelogistics.webapps" 
     { flatpakref = "https://sober.vinegarhq.org/sober.flatpakref"; sha256="1pj8y1xhiwgbnhrr3yr3ybpfis>
  ];


  # Home manager
  home-manager = {
        extraSpecialArgs = { inherit inputs;};
        users = {
                "user" = import ./home.nix;
        };
  };


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
  services.xserver = { 
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "it";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "it2";

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


  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "User";
    extraGroups = [ "networkmanager" "wheel" ]; 
  };

  # System version
  system.stateVersion = "24.05"; # Did you read the comment?

}
