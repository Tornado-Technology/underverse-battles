// Arguments: soul_type, bone, bone_size, side_is_changing, custom_repeats (optional)
		
callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, soul_type);
		
	side = fight_random_choose(dir.up, dir.down, dir.left, dir.right);
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var bone_speed = 1.5 + 0.2 * _power;
	
	if (side_is_changing) {
		side = fight_random_choose(dir.up, dir.down, dir.left, dir.right);
	}
	
	if (side == dir.left) {
		create_bone(border_instance.x - border_instance.left - 10, border_instance.y - border_instance.up, bone, bone_speed, bone_size, 0, 180);
		create_bone(border_instance.x + border_instance.right + 10, border_instance.y + border_instance.down, bone, bone_speed, bone_size, 180, 0);
	}
	if (side == dir.right) {
		create_bone(border_instance.x - border_instance.left - 10, border_instance.y + border_instance.down, bone, bone_speed, bone_size, 0, 0);
		create_bone(border_instance.x + border_instance.right + 10, border_instance.y - border_instance.up, bone, bone_speed, bone_size, 180, 180);
	}
	if (side == dir.up) {
		create_bone(border_instance.x - border_instance.left, border_instance.y - border_instance.up - 10, bone, bone_speed, bone_size, 270, 270);
		create_bone(border_instance.x + border_instance.right, border_instance.y + border_instance.down + 10, bone, bone_speed, bone_size, 90, 90);
	}
	if (side == dir.down) {
		create_bone(border_instance.x + border_instance.right, border_instance.y - border_instance.up - 10, bone, bone_speed, bone_size, 270, 90);
		create_bone(border_instance.x - border_instance.left, border_instance.y + border_instance.down + 10, bone, bone_speed, bone_size, 90, 270);
	}
}

var period = 65 - 5 * _power;
var repeats = 5 + _power;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 0.5, time_source_units_seconds, function() {
	instance_destroy();
});