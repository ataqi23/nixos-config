# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./pkgs.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "fidele";
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.useDHCP = false;
  networking.interfaces.enp3s0.useDHCP = true;
  networking.interfaces.wlp7s0.useDHCP = true;

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME 3 Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  
  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  hardware.pulseaudio.extraModules = [ pkgs.pulseaudio-modules-bt ];

  # Enable touchpad support
  services.xserver.libinput.enable = false;

  # Enable zsh terminal
  programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
	  ohMyZsh.enable = true;
    };

   # Define users
   users = {
   	users.Fidele = {
   	 	isNormalUser = true;
   	 	extraGroups = [ "wheel" ];
   	 	shell = pkgs.zsh;
   	 };
   	 #extraUsers.Fidele = { shell = pkgs.zsh };
   };
   
   #users.users.Fidele = {
   #  isNormalUser = true;
   #  extraGroups = [ "wheel" ]; 
    # shell = pkgs.zsh;
   #};

   #users.extraUsers.Fidele = {
   #  shell = pkgs.zsh;
   #};

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     firefox google-chrome
     git xclip
	 pandoc
     ulauncher
   ];
  
  # Allow unfree packages
   nixpkgs.config = {
      allowUnfree = true;
      allowBroken = true;	
   };
   
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
   programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;

  time.timeZone = "America/Los_Angeles";
  system.stateVersion = "20.09"; 

}

