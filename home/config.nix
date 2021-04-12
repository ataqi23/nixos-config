{
    packageOverrides = super: 
    let self = super.pkgs; 
    in {
     rEnv = super.rWrapper.override {
         packages = with self.rPackages; [
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
	 rstudioEnv = super.rstudioWrapper.override {
	    packages = with self.rPackages; [
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
    };

   # texlive = texlive.combine {
   #	inherit (texlive) scheme-small collection-langkorean algorithms cm-super;
   #	}
}










