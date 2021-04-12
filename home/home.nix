{ config, pkgs, ... }:

{
  # Allow home-manager to update and manage itself
  programs.home-manager.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Home user information
  home.username = "Fidele";
  home.homeDirectory = "/home/Fidele";

  # User packages
  home.packages = with pkgs; [
     texlive.combined.scheme-full
     rWrapper rstudioWrapper
     spotify spotifyd
  ];

  # Program configurations
  programs = {
     git = {
      	enable = true;
      	userName = "Ali Taqi";
      	userEmail = "alif.taqi00@gmail.com";
      	extraConfig.credential.helper = "store";
     };
     # Enable programs
     htop.enable = true;
 	 tmux.enable = true;
  };

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
        }) 
  ];

  home.stateVersion = "21.03";

  
}
