//Arguments: bone, bone_blue
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 10, battle_soul_type.blue);

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var rand_side = choose(dir.up, dir.left, dir.right);
	var bone_speed = 2 + _power * 0.3;
	var chance_blue_bones = irandom_range(1, 100);
	
	var bones = chance_blue_bones <= 25  ? bone_blue : bone; 
	var bone_size = random_range(2.9, 4.9);
	
	if (rand_side == dir.right) {
		var bone_instance = create_bone(border_instance.x + border_instance.right + 4, border_instance.y + border_instance.down, bones,
		bone_speed, bone_size, 180, 0);
	}
	else if (rand_side == dir.up) {
		var bone_instance = create_bone(border_instance.x + border_instance.right, border_instance.y - border_instance.up - 4, bones,
		bone_speed, bone_size, 270, 270);
	}
	else if (rand_side == dir.left) {
		var bone_instance = create_bone(border_instance.x - border_instance.left, border_instance.y - border_instance.up - 4, bones,
		bone_speed, bone_size, 270, 270);
	};
	
}

var period = 27 - 3 * _power;
var repeats = 10 + _power * 2;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
};

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});