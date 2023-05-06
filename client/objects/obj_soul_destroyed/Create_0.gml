gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

x = gui_width / 2;
y = gui_height / 2;

// Particle
part_peace = part_type_create();
part_type_shape(part_peace, pt_shape_sphere);
part_type_color1(part_peace, c_red);
part_type_alpha2(part_peace, 1, 0);
part_type_life(part_peace, 360, 360);
part_type_orientation(part_peace, 0, 359, 10, 0, false);
part_type_size(part_peace, 0.05, 0.05, 0, 0);
part_type_speed(part_peace, 1.5, 3, 0, 0);
part_type_direction(part_peace, 0, 359, 0, 0);
part_type_gravity(part_peace, 0.1, -90);

time_source_death = time_source_create(time_source_game, 1, time_source_units_seconds, function (pow) {
	repeat(5) part_particles_create(global.part_system_soul, x + irandom_range(-7, 7), y + irandom_range(-7, 7), part_peace, 1);
	audio_play_sound_once(snd_soul_death);
	instance_destroy();
});

time_source_start(time_source_death);

audio_play_sound_once(snd_soul_break);