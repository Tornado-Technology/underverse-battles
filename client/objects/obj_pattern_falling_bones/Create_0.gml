// Arguments: bone, sides

index = 0;
bone_instances = [];

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red, fight_network_mode);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var sides_count = array_length(sides);
	var random_side = sides[irandom_range(0, sides_count - 1)];
	var bone_x, bone_y;
	if (random_side == dir.up) {
		bone_x = choose(soul_instance.x, irandom_range(border_instance.x - border_instance.left, border_instance.x + border_instance.right));
		bone_y = border_instance.y - border_instance.up - 15;
	}
	if (random_side == dir.down) {
		bone_x = choose(soul_instance.x, irandom_range(border_instance.x - border_instance.left, border_instance.x + border_instance.right));
		bone_y = border_instance.y + border_instance.down + 15;
	}
	if (random_side == dir.left) {
		bone_x = border_instance.x - border_instance.left - 15;
		bone_y = choose(soul_instance.y, irandom_range(border_instance.y - border_instance.up, border_instance.y + border_instance.down));
	}
	if (random_side == dir.right) {
		bone_x = border_instance.x + border_instance.right + 15;
		bone_y = choose(soul_instance.y, irandom_range(border_instance.y - border_instance.up, border_instance.y + border_instance.down));
	}
	
	bone_instances[index] = create_falling_bone(bone_x, bone_y, bone, random_side + 90, random_side + 180, 2, 0.04 + _power * 0.02, fight_network_mode);
	index++;
}

var period = 18 - 2 * _power;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
	
time_source_update_destroy = time_source_create(time_source_game, (250 + 20 * _power) / 60, time_source_units_seconds, function () {
	instance_destroy();
});