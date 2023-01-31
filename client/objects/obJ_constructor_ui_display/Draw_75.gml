/// @desc Draw ping
draw_reset();

// Set draw options
draw_set_font(font_console_mini);
draw_set_halign(fa_right);

// Get positions
var width  = display_get_gui_width();
var height = display_get_gui_height();

if (show_ping) {
	var ping  = network_ping;
	
	// Pick color
	var color = c_lime;
	if (ping > 350)  color = c_yellow;
	if (ping > 2000) color = c_red;
	if (ping < 0)    color = merge_color(c_black, c_red, 0.7);
	
	// Draw ping
	var ping_text = network_ping == -1 ? "No connect" : string(network_ping) + "ms:Ping";
	draw_text_outlined(width - 2, 5, color, c_black, ping_text);
}

var draw_ping_x = width - 2;
var draw_ping_y = show_ping ? 13 : 5;

if (show_fps_style == 1 || show_fps_style == 3) {
	var color_fps = fps > 44 ? c_lime : (fps > 34 ? c_yellow : c_red); 
	draw_text_outlined(draw_ping_x, draw_ping_y, color_fps, c_black, string(fps) + ":FPS");
	draw_ping_y += 8;
}

if (show_fps_style == 2 || show_fps_style == 3) {
	if (current_time % 8 == 0) {
		value_rfps = round(fps_real);
		color_rfps = fps_real > 1399 ? c_lime : (fps_real > 1000 ? c_yellow : c_red);
	}
	
	draw_text_outlined(draw_ping_x, draw_ping_y, color_rfps, c_black, string(value_rfps) + ":RFPS");
}

// Reset
draw_reset();
