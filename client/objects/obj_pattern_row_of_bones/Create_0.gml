// Arguments: bone

random_side = irandom_range(dir.left, dir.right);

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 8, battle_soul_type.blue);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var offset = -5;
	var side = -border_instance.left + offset;
	var bone_dir = 0;
	if (random_side == dir.right) {
		offset = 5;
		side = border_instance.right + offset;
		bone_dir = 180;
	}
	for (var i = 0; i < 5; ++i) {
		create_bone(border_instance.x + side + offset*i*2, border_instance.y + border_instance.down + 4, bone, 2 + 0.1 * _power, 1 + sin(pi*i/4), bone_dir, 0);
	}
}

time_source_update = time_source_create(time_source_game, 4/3, time_source_units_seconds, function () {
	update();
}, [], -1);
	
time_source_update_destroy = time_source_create(time_source_game, (300 + 60 * _power) / 60, time_source_units_seconds, function () {
	instance_destroy();
});