sprite_index = noone;

///@desc States
width  = 100;
height = 100;
color = c_white;
image  = noone;
scale_x = 1; // Only for image
scale_y = 1; // Only for image

url   = ""; 
hover = 0;
event = noone; // Work if <url = "">

_hover_time = 0;
_hover_time_limit = convert_seconds_to_steps(0.2);

is_active = true;

get_width = function() {
	if (image == noone) return width;
	return sprite_get_width(image) * scale_x;
}

get_height = function() {
	if (image == noone) return height;
	return sprite_get_height(image) * scale_y;
}

get_hover = function() {
	return point_in_rectangle_gui(x, y, x + get_width(), y + get_height());
}

on_click = function () {
	if (!get_hover() || !mouse_check_button_pressed(mb_left)) return;
	
	if (url != "") { 
		url_open(url);
		achievement_give(achievement_id.link);
	}
	
	if (event == noone) return;
	
	event();
}


enable = function() {
	is_active = true;
}

disable = function() {
	is_active = false;
}
