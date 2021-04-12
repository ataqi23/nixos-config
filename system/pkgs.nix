{ config, pkgs, ... }:
{ environment.systemPackages = with pkgs; [
    # Command line interfaces
    which wget tmux parted unzip parallel findutils xorriso xclip
    # Resource monitor
    htop
    # Editors
    vim micro
    # C++
    gnumake gdb valgrind
    # Shell
    zsh
    # Documents
    pandoc
	# Entertainment
    # spotify
    # spotifyd
    # spotify-tui
  ];

   #spotifyd = {
   #     enable = true;
   #     settings = {
   #       global = {
   #         username = "alif.taqi@hotmail.com";
   #         password_cmd = "pass show spotify.com | head -n 1";
   #         device_name = "Neptune";
   #       };
   #     };
   #   };
}
