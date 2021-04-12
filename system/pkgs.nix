{ config, pkgs, ... }:
{ environment.systemPackages = with pkgs; [
    # Command line utilities
    which wget tmux parted unzip parallel findutils xorriso xclip
    # Resource monitor
    htop
    # Editors
    vim micro sublime
    # C++
    gnumake gdb valgrind
    # Shell
    zsh
    # Documents
    pandoc
  ];
}
