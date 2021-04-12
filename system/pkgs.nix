{ config, pkgs, ... }:
{ environment.systemPackages = with pkgs; [
    #Basic Command line interfaces
	zsh antigen oh-my-zsh # Shell
    which
    wget
    tmux
    #matrix # Not working
    parted
    unzip
    vim micro
    gnumake gdb valgrind # C++
	htop
    parallel
    findutils
    xorriso
    
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
