depth = fight_depth.soul;

image_speed = 0;

follow_board = false;
board_instance = obj_battle_border;

invincibility = 0;
collider_soul = instance_create_depth(x, y, fight_depth.soul, obj_battle_collider_soul_otherplayer);

moveable = true;
ability = false;

next_x = x;
next_y = y;

playerId = 0;

skip_frame = 0;

is_otherplayer_soul = true;

// Stun
is_stunned = false;
stun = function() {
	moveable = false;
	is_stunned = true;
	effect_fade(0.1, 1, c_blue, c_blue, true, 0);
	battle_border_set_color(false, false, c_blue);
}

// Particles
part_type_tail = part_type_create();
part_type_sprite(part_type_tail, sprite_index, false, false, false);
part_type_alpha2(part_type_tail, 1, 0);
part_type_life(part_type_tail, 20, 20);


change_effect = function () {
	part_type_change = part_type_create();
	part_type_sprite(part_type_change, sprite_index, false, false, false);
	part_type_alpha2(part_type_change, 1, 0);
	part_type_life(part_type_change, 20, 20);
	part_type_orientation(part_type_change, image_angle, image_angle, 0, 0, false);
	part_type_size(part_type_change, 1, 1, 0.1, 0);
	part_particles_create(global.part_system_soul, x, y, part_type_change, 1);
}