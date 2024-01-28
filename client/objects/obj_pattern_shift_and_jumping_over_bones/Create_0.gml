// Arguments: bone
		
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 8, battle_soul_type.blue);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var bone_speed = 1.2 + _power * 0.2;
	create_bone(border_instance.x - border_instance.left - 10, border_instance.y + border_instance.down + 20, bone, bone_speed, 2, 0, 0);
	create_bone(border_instance.x + border_instance.right + 10, border_instance.y - border_instance.up - 20, bone, bone_speed, 5.4, 180, 180);
}

var period = 60 - _power * 4;
var repeats = 5 + _power;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});