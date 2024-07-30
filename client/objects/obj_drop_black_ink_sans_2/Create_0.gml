event_inherited();

damage = get_char_damage(obj_character_ink_sans);
gradually_alpha = true;
speed_const = 2;
time_create_ink = 100;
time_create_ink_step = 0.2;
time_create_ink_max = 100;
destroying = false;
image_yscale = 5;
// Particle
part_type_ui_ink = part_type_create();
part_type_sprite(part_type_ui_ink, spr_ink_ui_ink_sans, false, false, false);
part_type_color1(part_type_ui_ink, c_black);
part_type_alpha2(part_type_ui_ink, 1, 0);
part_type_life(part_type_ui_ink, 580, 600);
part_type_orientation(part_type_ui_ink, 0, 360, 0, 0, false);
part_type_size(part_type_ui_ink, 1.4, 1.5, 0, 0);

time_source_destroy_self = time_source_create(time_source_game, 50 / 60, time_source_units_seconds, function () {
	destroying = true;	
})