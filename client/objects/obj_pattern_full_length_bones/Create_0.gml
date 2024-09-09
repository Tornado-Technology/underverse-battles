// Arguments: bone

switch (_power) {
	case 0:
		bone_size = 8.3;
		break;
	case 1:
		bone_size = 7.75;
		break;
	case 2:
		bone_size = 7.2;
		break;
	case 3:
		bone_size = 6.65;
		break;
	default:
		bone_size = 6.1;
		break;
}

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var rand_side = fight_random_choose(dir.up, dir.down, dir.left, dir.right);
	var bone_speed = fight_random_float(2 - _power * 0.1, 2 + _power * 0.1);
	if (rand_side == dir.left) {
		var bone_instance = create_bone(border_instance.x - border_instance.left - 4, border_instance.y + border_instance.down, bone,
		bone_speed, bone_size, 0, 0);
	}
	else if (rand_side == dir.right) {
		var bone_instance = create_bone(border_instance.x + border_instance.right + 4, border_instance.y + border_instance.down, bone,
		bone_speed, bone_size, 180, 0);
	}
	else if (rand_side == dir.down) {
		var bone_instance = create_bone(border_instance.x + border_instance.right, border_instance.y + border_instance.down + 4, bone,
		bone_speed, bone_size, 90, 90);
	}
	else if (rand_side == dir.up) {
		var bone_instance = create_bone(border_instance.x + border_instance.right, border_instance.y - border_instance.up - 4, bone,
		bone_speed, bone_size, 270, 90);
	}
}

var period = 50 - _power * 5;
var repeats = 5 + _power * 2;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});