	
partice = part_system_create(partice_fall_effect);

part_system_automatic_draw(partice, false);
	
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);

	
	time_source_start(time_source_update_upward_movement);
	time_source_start(time_source_update_destroy);
};
	

update_upward_movement = function () {
	soul_instance.y += 1.4;
	part_system_position(partice, border_instance.x, border_instance.y - border_instance.up - 20);
	part_system_depth(partice, fight_depth.bullet_outside);
}


time_source_update_upward_movement = time_source_create(time_source_game, 1 / 60, time_source_units_seconds, function () {
	update_upward_movement();
}, [], -1);



time_source_update_destroy = time_source_create(time_source_game, 3 / 60, time_source_units_seconds, function () {
	final_function();
});