if (background_obj != noone) exit;

var spr = spr_background_last_coridor;
if (background != noone || background != -1) { 
	spr = background;
}

draw_sprite(spr, 0, 0, 0);