// Arguments: bone, gasterblaster

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 9, battle_soul_type.blue);
		
	update_gasterblasters();
	time_source_start(time_source_update_gasterblasters);
	time_source_start(time_source_update_bones);
	time_source_start(time_source_update_destroy);
}

update_gasterblasters = function() {
	repeat (_power == 5 ? 2 : 1) {
		var _gb_pos = fight_random_integer(0, 2);
		var border_dist = 100;
		switch (_gb_pos) {
			case 0:
				create_gasterblaster(gasterblaster, border_instance.x + 20, border_instance.y - border_instance.up - border_dist, border_instance.x + 20, border_instance.y, 0, 1/6, 1, 15/60, 1/6);
				break;
			case 1:
				create_gasterblaster(gasterblaster, border_instance.x, border_instance.y - border_instance.up - border_dist, border_instance.x, border_instance.y, 0, 1/6, 1, 15/60, 1/6);
				break;
			case 2:
				create_gasterblaster(gasterblaster, border_instance.x - 20, border_instance.y - border_instance.up - border_dist, border_instance.x - 20, border_instance.y, 0, 1/6, 1, 15/60, 1/6);
				break;
		}
	}
}
	
update_bones = function() {
	var randim_side = fight_random_choose(dir.left, dir.right);
	var bone_speed = 1 + _power * 0.1;
	if (randim_side == dir.left)
		create_bone(border_instance.x - border_instance.left - 10, border_instance.y + border_instance.down + 10, bone, bone_speed, 1.4, 0, 0);
	else
		create_bone(border_instance.x + border_instance.right + 10, border_instance.y + border_instance.down + 10, bone, bone_speed, 1.4, 180, 0);
}

var period = 65 - _power * 6;
var repeats = 5 + _power;
time_source_update_gasterblasters = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_gasterblasters(_power);
}, [], repeats - 1);
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});
period += 30;
time_source_update_bones = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_bones();
}, [], -1);