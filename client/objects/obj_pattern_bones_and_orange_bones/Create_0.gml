// Arguments: bone, orange_bone

callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update(bone);
	time_source_start(time_source_update);
	time_source_start(time_source_update_orange_bone);
	time_source_start(time_source_update_destroy);
}

update = function(selected_bone) {
	var rand_side = fight_random_integer(0, 7);
	
	var random_speed = selected_bone == orange_bone ? 2.4 + fight_random_float(0, _power * 0.2) : 2 + fight_random_float(0, _power * 0.1);
	
	var max_size = 8.3;
	var random_size = selected_bone == orange_bone ? max_size : fight_random_float(3 + _power * 0.2, 4.8);
	if (rand_side == 0) {
		var bone_instance = create_bone(border_instance.x - border_instance.left - 4, border_instance.y + border_instance.down, selected_bone,
		random_speed, random_size, 0, 0);
	}
	if (rand_side == 1) {
		var bone_instance = create_bone(border_instance.x + border_instance.right + 4, border_instance.y - border_instance.up, selected_bone,
		random_speed, random_size, 180, 180);
	}
	if (rand_side == 2) {
		var bone_instance = create_bone(border_instance.x - border_instance.left - 4, border_instance.y - border_instance.up, selected_bone,
		random_speed, random_size, 0, 180);
	}
	if (rand_side == 3) {
		var bone_instance = create_bone(border_instance.x + border_instance.right + 4, border_instance.y + border_instance.down, selected_bone,
		random_speed, random_size, 180, 0);
	}
	if (rand_side == 4) {
		var bone_instance = create_bone(border_instance.x + border_instance.right, border_instance.y + border_instance.down + 4, selected_bone,
		random_speed, random_size, 90, 90);
	}
	if (rand_side == 5) {
		var bone_instance = create_bone(border_instance.x - border_instance.left, border_instance.y - border_instance.up - 4, selected_bone,
		random_speed, random_size, 270, 270);
	}
	if (rand_side == 6) {
		var bone_instance = create_bone(border_instance.x - border_instance.left, border_instance.y + border_instance.down + 4, selected_bone,
		random_speed, random_size, 90, 270);
	}
	if (rand_side == 7) {
		var bone_instance = create_bone(border_instance.x + border_instance.right, border_instance.y - border_instance.up - 4, selected_bone,
		random_speed, random_size, 270, 90);
	}
}

var period_bone = 60 - _power * 5;
var period_orange_bone = 90 - _power * 5;
var repeats = 6 + _power * 3;

time_source_update = time_source_create(time_source_game, period_bone / 60, time_source_units_seconds, function() {
	update(bone);
}, [], repeats - 1);

time_source_update_orange_bone = time_source_create(time_source_game, period_orange_bone / 60, time_source_units_seconds, function() {
	update(orange_bone);
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period_bone * repeats / 60 + 1, time_source_units_seconds, function() {
	instance_destroy();
});