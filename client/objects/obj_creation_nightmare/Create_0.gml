event_inherited();

disable_surface = true;

damage = get_char_damage(obj_character_nightmare);

soul_invulnerability = 20;

image_alpha = 0;
target_position = new Vector2(x, y);

damage = 2;

bonb = function () {
	var angle_offset = irandom_range(120, 480);
	var angle = angle_offset / 4;
	var i = angle;
	
	while(i <= angle_offset) {
		create_spike(x + dcos(i), y + -dsin(i), obj_spike_nightmare, 3, i);
		i+= angle;
	}
	
	instance_destroy();
}

time_source_spwan = time_source_create(time_source_game,  20 / 60, time_source_units_seconds, function () {
	var target = point_direction(x, y, obj_battle_soul.x, obj_battle_soul.y);
	create_spike(x, y + -dsin(40) * sprite_height,  obj_bullets_nightmare, 3, target);
}, [], -1);

time_source_start(time_source_spwan);