sprite_index = spr_battle_soul_red;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

is_shaking = true;

// Particle
part_peace = part_type_create();
part_type_sprite(part_peace, spr_pixel, false, false, false);
part_type_color1(part_peace, c_red);
part_type_alpha2(part_peace, 1, 0);
part_type_life(part_peace, 360, 360);
part_type_orientation(part_peace, 0, 359, 10, 0, false);
part_type_size_y(part_peace, 2, 2, 0, 0);
part_type_speed(part_peace, 1.5, 3, 0, 0);
part_type_direction(part_peace, 0, 359, 0, 0);
part_type_gravity(part_peace, 0.1, -90);

// Camera
camera_set_target(x, y);
camera_change_zoom(2, 1, true);

// Time sources
time_source_break = time_source_create(time_source_game, 0.5, time_source_units_seconds, function () {
	sprite_index = spr_battle_soul_red_destroyed;
	is_shaking = false;
	audio_play_sound_once(snd_soul_break);
	time_source_start(time_source_death);
});

time_source_death = time_source_create(time_source_game, 1, time_source_units_seconds, function () {
	sprite_index = spr_empty;
	repeat(5) part_particles_create(global.part_system_soul, x + irandom_range(-7, 7), y + irandom_range(-7, 7), part_peace, 1);
	audio_play_sound_once(snd_soul_death);
	time_source_start(time_source_end);
});

time_source_end = time_source_create(time_source_game, 3.5, time_source_units_seconds, function () {
	callback();
	instance_destroy();
});

time_source_start(time_source_break);