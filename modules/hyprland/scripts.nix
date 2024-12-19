{

  home.file.".nixos/modules/hyprland/scripts/wallchooser.sh" = {
	executable = true;
	text = ''

	#!/bin/sh
	cd $HOME/.nixos/wallpapers/

	imgpath=$(yad --width 800 --height 600 --file --add-preview --large-preview --title='Choose wallpaper')

	swww img $imgpath --transition-step 100 --transition-fps 120 --transition-type grow --transition-duration 1

	'';
  };




  home.file.".nixos/modules/hyprland/scripts/gamemode.sh" = {
	executable = true;
	text = ''

	#!/usr/bin/env sh
	HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
	if [ "$HYPRGAMEMODE" = 1 ] ; then
    		hyprctl --batch "\
        		keyword animations:enabled 0;\
        		keyword decoration:shadow:enabled 0;\
        		keyword decoration:blur:enabled 0;\
        		keyword general:gaps_in 0;\
        		keyword general:gaps_out 0;\
        		keyword general:border_size 1;\
        		keyword decoration:rounding 0"
    		exit
	fi
	hyprctl reload

	'';
  };




  home.file.".nixos/modules/hyprland/scripts/layout.sh" = {
	executable = true;
	text = ''

	#!/bin/sh

	FLOATING_STATE_FILE="$HOME/.hyprland_floating_state"

	if [ -f "$FLOATING_STATE_FILE" ] && [ "$(cat "$FLOATING_STATE_FILE")" == "enabled" ]; then
	    hyprctl reload
	    pkill -f nwg-dock-hyprland
	    pkill gjs
	    ags run /home/user/.nixos/modules/hyprland/rice/ags/ &
	    rm "$FLOATING_STATE_FILE" 
	else 
	    hyprctl --batch "keyword windowrulev2 float, class:.*"
	    nwg-dock-hyprland -i 35 -d &
	    pkill gjs
	    ags run /home/user/.nixos/modules/hyprland/rice/ags-de/ &
	    echo "enabled" > "$FLOATING_STATE_FILE" 
	fi	

	'';
  };

}
