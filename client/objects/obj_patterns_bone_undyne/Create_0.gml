callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}


update = function() {
var	count_mini_bone = _power div 2 + 4;

var angle_bone = irandom_range(0, 1) ? 330 : 360;
var delta_angle = angle_bone / count_mini_bone;
var	_speed = 2 + _power * 0.1;
var offset = 10;
for (var i = delta_angle; i <= angle_bone; i += delta_angle) {
		var instance = instance_create_depth(soul_instance.x + dcos(i) * 90, soul_instance.y + -dsin(i) * 90, fight_depth.bullet_outside_hight, obj_bone_nightmare);
		instance.speed_const = _speed;
		var point = point_direction(instance.x, instance.y, soul_instance.x, soul_instance.y);
		instance.direction = point;
		instance.image_angle = point;
		instance.angle_speed = _speed;
	}	
	
}

time_source_update = time_source_create(time_source_game, (40 + _power * 2) / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, (280 + _power * 30) / 60, time_source_units_seconds, function () {
	instance_destroy();
});