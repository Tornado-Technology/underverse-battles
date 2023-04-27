event_inherited();
if (act < 1) exit;

// Reset
draw_reset();

// Camera
var local_camera_position = Vector2(0, 0);
local_camera_position.y += shift;

// Dialog window
draw_sprite(spr_dialog_window, 0, local_camera_position.x + 78, local_camera_position.y + 5);

// Main text
draw_set_font(font);
draw_set_halign(fa_left);
draw_set_colour(text_color);

draw_text_ext(local_camera_position.x + 83, local_camera_position.y + 10, str, 16, 290);

//Answer options
draw_set_halign(fa_left);
if (act == 2 && pos == string_length(cur_text)) {
	answer_options[0].draw(local_camera_position.x + 123, local_camera_position.y + 62);
	answer_options[1].draw(local_camera_position.x + 123 + 140, local_camera_position.y + 62);
}