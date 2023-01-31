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

//Answer options
draw_set_halign(fa_left);
if (act == 2 && pos == string_length(cur_text)) {
	draw_set_color_selected_button(current_option, 0, c_yellow, c_white);
	draw_text_ext(local_camera_position.x + 83, local_camera_position.y + 42, answer_options[0], 16, 130);
	draw_set_color_selected_button(current_option, 1, c_yellow, c_white);
	draw_text_ext(local_camera_position.x + 83 + 140, local_camera_position.y + 42, answer_options[1], 16, 130);
}