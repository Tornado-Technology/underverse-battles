event_inherited();

// Type
color_type = battle_soul_type.red;

// Movement
speed_const = 1.8;

// Time sources
time_source_slowdown = time_source_create(time_source_game, 0.5, time_source_units_seconds, function () {
	speed_const = 1.8;
});