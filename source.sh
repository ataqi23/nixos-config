#!/bin/sh

#==================================#
#			SYSTEM FILES                      
#==================================#

# Remove the existing files
for f in system/configuration.nix system/hardware-configuration.nix system/pkgs.nix
do
 rm -rf $f
done

#xargs --arg-file=system-files.txt rm -rf # DELETES THE SYSTEM FILES. BAD COMMAND. WARNING.

# Copy them from developing environment
xargs --arg-file=system-files.txt cp --target-directory=system

#==================================#
#			 HOME FILES                      
#==================================#

# Remove the existing files
for f in home/home.nix home/config.nix home/commands
do
 rm -rf $f
done

# Copy them from developing environment
xargs --arg-file=home-files.txt cp --target-directory=home
