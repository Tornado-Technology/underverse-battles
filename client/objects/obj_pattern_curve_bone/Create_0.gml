// bone_curve

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);	

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {	
var	count_mini_bone = _power div 2 + 4;
var delta_angle = 360 / count_mini_bone;
var	_speed = 3 + _power * 0.2;
var offset = 10;
var delta_speed_between_mini_bone = 4  + _power * 0.2;	
var coord = rand_side_from(border_instance.x - border_instance.left - offset, border_instance.y - border_instance.up - offset, border_instance.x + border_instance.right + offset, border_instance.y + border_instance.down + offset);

for (var i = delta_angle; i <= 360; i += delta_angle) {
		var instance = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, bone_curve);
		instance.base_angle = i;
		instance.line_speed = _speed + delta_speed_between_mini_bone;
		instance.base_angle_speed = 4;
	}	
}

var period = 33 - 3 * _power;
var repeats = 5 + _power;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 0.5, time_source_units_seconds, function () {
	instance_destroy();
});