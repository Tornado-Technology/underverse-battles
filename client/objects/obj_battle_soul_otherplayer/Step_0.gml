if (follow_board) {
	x += board_instance.x - board_instance.xprevious;
	y += board_instance.y - board_instance.yprevious;
}

image_blend = c_white;
if (invincibility > 0) {
	invincibility = approach(invincibility, 0, 1);
	var color_index = wave(1, -1, 1, 0); 
	if (color_index > 0) {
		image_blend = make_color_rgb(90, 90, 90);
	}
}

// Orange soul ability
if (ability) {
	if (sprite_index == spr_battle_soul_orange) {
		part_type_sprite(part_type_tail, sprite_index, false, false, false);
		part_particles_create(part_system, x, y, part_type_tail, 1);
	}
}