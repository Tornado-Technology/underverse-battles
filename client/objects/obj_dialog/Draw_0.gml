if (act < 1) exit;

// Reset
draw_reset();

// Camera
var camera_position = obj_camera.camera_position;
var local_camera_position = Vector2(camera_position.x, camera_position.y);
local_camera_position.y += shift;

// Dialog window
draw_sprite(spr_dialog_window, 0, local_camera_position.x + 78, local_camera_position.y + 5);
    
// Main text
draw_set_font(dialog_font);
draw_set_halign(fa_left);
draw_set_colour(dialog_color);
		
draw_text_ext(local_camera_position.x + 83, local_camera_position.y + 10, str, 16, 290);
    
// Speaker's frame
if (frame != noone) {
	draw_sprite(frame, 0, local_camera_position.x + 20, local_camera_position.y + 20);
}	
//continue arrow
if (pos > 0 && pos == string_length(cur_text)) {
	draw_sprite_ext(spr_stat_arrow, 0, local_camera_position.x + 372, local_camera_position.y + 60, 1, 1, 270, c_white, 1);
}