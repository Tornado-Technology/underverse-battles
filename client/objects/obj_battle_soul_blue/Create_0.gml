event_inherited();

// Type
color_type = battle_soul_type.blue;

// Movement
speed_const = 1.8;
vertical_speed_const = 2.5;

platform_inertion = 0;
gravity_sum = 0;
grav = 0.05;

right = false;
left = false;
up = false;
down = false;

is_jumping = false;
max_fly_time = 5;
fly_time = max_fly_time;

gravity_force = dir.down;

blue_attack_force_speed_x = 0;
blue_attack_force_speed_y = 0;

blue_attack = false;
has_infinity_jump = false;

if (global.fight_instance != noone) {
	var player = fight_get_player(1 - fight_get_initiative());
	if (player.has_soul_changeable_parameters) {
		speed_const = player.soul_custom_speed;
		max_fly_time = player.soul_custom_fly_time;
	}
}

/// @param {Real} angle
set_angle = function(angle) {
	image_angle = angle;
	collider_soul.image_angle = angle;
}

/// @param {Real} angle
change_gravity_force = function(angle) {
	gravity_force = angle;
	fly_time = max_fly_time;
	blue_attack = true;
}

// Time source
time_source_slowdown = time_source_create(time_source_game, 0.5, time_source_units_seconds, function () {
	speed_const = 1.8;
});