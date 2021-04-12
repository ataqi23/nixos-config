{ config, pkgs, ... }:
{ environment.systemPackages = with pkgs; [
	# Web browsers
	google-chrome firefox
	# Version control
	git
    # Command line utilities
    which wget tmux parted unzip parallel findutils xorriso xclip
    # Resource monitor
    htop
    # Editors
    vim micro sublime
    # C++ tools
    gnumake gdb valgrind
    # Shell
    zsh
    # Documents
    pandoc
    # App launcher
    ulauncher
  ];
}
