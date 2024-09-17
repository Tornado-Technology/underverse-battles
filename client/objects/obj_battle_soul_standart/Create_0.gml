event_inherited();

// Type
color_type = battle_soul_type.red;

// Movement
speed_const_max = 1.8;
speed_const = speed_const_max;

if (global.fight_instance != noone) {
	var player = fight_get_player(1 - fight_get_initiative());
	if (player.has_soul_changeable_parameters) {
		speed_const_max = player.soul_custom_speed;
		speed_const = speed_const_max;
	}
}

// Time sources
time_source_slowdown = time_source_create(time_source_game, 0.5, time_source_units_seconds, function () {
	speed_const = speed_const_max;
});