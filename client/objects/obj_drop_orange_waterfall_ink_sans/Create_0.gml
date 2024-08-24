event_inherited();

damage = get_char_damage(obj_character_ink_sans);

border_down = obj_battle_border.y + obj_battle_border.down + 5;
is_growing = true;

destroying = false;

speed_const = 2;
step = 0.06;


time_create_ink = 100;
time_create_ink_step = 0.2;
time_create_ink_max = 100;

// Particle
part_type_ui_ink = part_type_create();
part_type_sprite(part_type_ui_ink, spr_ink_ui_ink_sans, false, false, false);
part_type_color1(part_type_ui_ink, c_orange);
part_type_alpha2(part_type_ui_ink, 1, 0);
part_type_life(part_type_ui_ink, 580, 600);
part_type_orientation(part_type_ui_ink, 0, 360, 0, 0, false);
part_type_size(part_type_ui_ink, 0.9, 1, 0, 0);

spwan_ink = function () {
	var width = sprite_width ;
	var position_x = x + fight_random_choose(-width, width);
	var position_y = y + fight_random_float(2, sprite_height);
	
	instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, obj_drop_orange_ink_sans, {
		use_gravity_force: true,
		direction: 180 + fight_random_integer(10, 180),
		speed_const: speed_const
	});
}

time_source_spwan = time_source_create(time_source_game, 25 / 60, time_source_units_seconds, function () {
	spwan_ink();
}, [], -1);

time_source_destroying = time_source_create(time_source_game, 30 / 60, time_source_units_seconds, function () {
	destroying = true;
});


time_source_start(time_source_spwan);
