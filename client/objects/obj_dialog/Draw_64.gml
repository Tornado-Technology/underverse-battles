if (act < 1) exit;

// Reset
draw_reset();

// Camera
var local_camera_position = new Vector2(0, 0);
local_camera_position.y += side == dir.down ? shift : 0;

// Dialog window
draw_sprite(spr_dialog_window, 0, local_camera_position.x + 78, local_camera_position.y + 5);
    
// Main text
draw_set_font(font);
draw_set_halign(fa_left);
draw_set_colour(text_color);
		
draw_text_ext(local_camera_position.x + 85, local_camera_position.y + 10, str, 16, 290);
    
// Speaker's frame
if (frame != noone) {
	draw_sprite(frame, 0, local_camera_position.x + 20, local_camera_position.y + 20);
}	
//continue arrow
skip_arrow.draw(local_camera_position.x + 372, local_camera_position.y + 60, 1, 270);