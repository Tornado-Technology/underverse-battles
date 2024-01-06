event_inherited();

platform_inertion = 0;
grav = 0.05;

right = false;
left = false;
up = false;
down = false;

is_jumping = false;
max_fly_time = 10;
fly_time = max_fly_time;

gravity_force = dir.down;

blue_attack_force_speed_x = 0;
blue_attack_force_speed_y = 0;

blue_attack = false;

/// @param {Real} angle
set_angle = function(angle) {
	image_angle = angle;
	collider_soul.image_angle = angle;
}

/// @param {Real} angle
change_gravity_force = function(angle) {
	gravity_force = angle;
	max_fly_time = 60;
	fly_time = max_fly_time;
	blue_attack = true;
}

strict_place_meeting_walls = function() {
	//var original_sprite_width = 1;
	//var original_sprite_height = 1;
	
	//var full_movement_x = movement_speed_x + outside_force_x + tremble_force_x + border_force_x + blue_attack_force_speed_x;
	//var full_movement_x_sign = sign(full_movement_x);
	//if (place_meeting(x + full_movement_x, y, obj_solid) || !is_inside_border_x) {
	//	fly_time = 0;
	//	movement_speed_x = 0;
	
	//	if (outside_force_x != 0) {
	//		fight_soul_damage(pusher_instance.damage, pusher_instance.destructible, pusher_instance);
	//	}
	
	//	outside_force_x = 0;
	//	tremble_force_x = 0;
	//	blue_attack_force_speed_x = 0;
	//	platform_inertion = 0;
	//	border_force_x = border_delta_x;
		
	//	is_inside_border_x = true;
	//}
	//else {
	//	border_force_x = 0;
	//}

	//var full_movement_y = movement_speed_y + outside_force_y + tremble_force_y + border_force_y + blue_attack_force_speed_y;
	//var full_movement_y_sign = sign(full_movement_y);
	//if (place_meeting(x, y + full_movement_y, obj_solid) || !is_inside_border_y) {
	//	fly_time = 0;
	//	movement_speed_y = 0;
	
	//	if (outside_force_y != 0) {
	//		fight_soul_damage(pusher_instance.damage, pusher_instance.destructible, pusher_instance);
	//	}
		
	//	outside_force_y = 0;
	//	tremble_force_y = 0;
	//	blue_attack_force_speed_y = 0;
	//	platform_inertion = 0;
	//	border_force_y = border_delta_y;
		
	//	is_inside_border_y = true;
	//}
	//else {
	//	border_force_y = 0;
	//}
}