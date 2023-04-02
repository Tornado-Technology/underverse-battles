// I so lasy make it hands
depth = fight_depth.soul;

// Actions
follow_board = false;
moveable = true;
ability = false;

// Network stuff
is_otherplayer_soul = false;
skip_frame = 0;


blue_attack = false;

// Invincibility
invincibility = 0;
invincibility_update = function() {
	image_blend = c_white;
	if (invincibility > 0) {
		invincibility = approach(invincibility, 0, round(dtime));
		
		var color_index = wave(1, -1, 1, 0); 
		if (color_index > 0) {
			image_blend = make_color_rgb(90, 90, 90);
		}
	}
}

// Tremble
trembles = false;
tremble_time = 0;
tremble_time_max = 180;
tremble_force_x = 0;
tremble_force_y = 0;
tremble_update = function() {
	if (trembles) {
		var rand_side = choose(dir.up, dir.down, dir.left, dir.right);
		tremble_force_x = 0;
		tremble_force_y = 0;
		if (rand_side == dir.up) tremble_force_y = -1;
		if (rand_side == dir.down) tremble_force_y = 1;
		if (rand_side == dir.left) tremble_force_x = -1;
		if (rand_side == dir.right) tremble_force_x = 1;
		tremble_time++;
		if (tremble_time == tremble_time_max) {
			trembles = false;
			tremble_time = 0;
			tremble_force_x = 0;
			tremble_force_y = 0;
		}
	}
}

// Particles
change_effect = function () {
	part_type_change = part_type_create();
	part_type_sprite(part_type_change, sprite_index, false, false, false);
	part_type_alpha2(part_type_change, 1, 0);
	part_type_life(part_type_change, 20, 20);
	part_type_orientation(part_type_change, image_angle, image_angle, 0, 0, false);
	part_type_size(part_type_change, 1, 1, 0.1, 0);
	part_particles_create(global.part_system_bullet, x, y, part_type_change, 1);
}

// Create collider soul
collider_soul = instance_create_depth(x, y, depth, obj_battle_collider_soul);