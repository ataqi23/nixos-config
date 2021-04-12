{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "Fidele";
  home.homeDirectory = "/home/Fidele";

  # User packages
  home.packages = with pkgs; [
     texlive.combined.scheme-full
     rWrapper rstudioWrapper
  ];
  programs = {
     git = {
      	enable = true;
      	userName = "Ali Taqi";
      	userEmail = "alif.taqi00@gmail.com";
      	extraConfig = {
      	    #credential.helper = "libsecret";
      	    credential.helper = "store";
       };
     };
     htop.enable = true;
 	 tmux.enable = true;
# 	 zsh = {
# 	 	enable = true;
# 	 	dotDir = ".config/zsh";
# 	 	oh-my-zsh = {
#            enable = true;
#            plugins = [ "git" "sudo" ];
#            theme = "lambda";
#          };
# 	 }; 
  };



  #zsh = {
  #        enable = true;
  #       
          #shellAliases = {
          #  ".." = "cd ..";
          #  "..." = "cd ../..";
          #  "...." = "cd ../../..";
          #  "nrs" = "sudo nixos-rebuild switch";
          #};
   #      
   #     };


  
  # R development environment
  nixpkgs.overlays = [ (self: super: {
      rstudioWrapper = super.rstudioWrapper.override {
          packages = with self.rPackages; 
          [
          	knitr rmarkdown digest Rcpp htmltools jsonlite base64enc
		  	yaml
          	devtools
          	tidyverse
		  	ggplot2 dplyr magrittr
		  	RColorBrewer viridis patchwork gridExtra
          	optparse	
          	reshape2
          	purrr
          	furrr future
          	matrixcalc
          ];
      };
  }) ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  
}
