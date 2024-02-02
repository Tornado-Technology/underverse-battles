// I so lasy make it hands
depth = fight_depth.soul;

// Type
color_type = battle_soul_type.white;

// Size
half_width = sprite_width / 2;
half_height = sprite_height / 2;

// Movement
moveable = true;

movement_speed_x = 0;
movement_speed_y = 0;

outside_force_x = 0;
outside_force_y = 0;

border_delta_x = 0;
border_delta_y = 0;

border_force_x = 0;
border_force_y = 0;

movement_delta_min = 0.01;

// Actions
follow_board = false;
ability = false;
blue_attack = false;

// Network stuff
is_otherplayer_soul = false;
skip_frame = 0;

// Collision with projectiles
list_projectiles = ds_list_create();
has_collision = false;
has_collision_up = false;
has_collision_down = false;
has_collision_left = false;
has_collision_right = false;
is_pushed = false;
pusher_instance = noone;

// Collision with border
is_inside_border_x = true;
is_inside_border_y = true;

update_push_damage = function () {
	if (has_collision && is_pushed && instance_exists(pusher_instance)) {
		fight_soul_damage(pusher_instance.damage, pusher_instance.destructible, pusher_instance);
	}
}

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

// Stun
is_stunned = false;
stun = function() {
	moveable = false;
	is_stunned = true;
	effect_fade(0.1, 1, c_blue, c_blue, true, 0);
	battle_border_set_color(false, false, c_blue);
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
		
		var tremble_force_speed = dtime;
		if (rand_side == dir.up) tremble_force_y = -tremble_force_speed;
		if (rand_side == dir.down) tremble_force_y = tremble_force_speed;
		if (rand_side == dir.left) tremble_force_x = -tremble_force_speed;
		if (rand_side == dir.right) tremble_force_x = tremble_force_speed;
		tremble_time++;
		if (tremble_time == tremble_time_max) {
			trembles = false;
			tremble_time = 0;
			tremble_force_x = 0;
			tremble_force_y = 0;
		}
	}
}

// Particle
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

// Create collider soul
event_user(5);