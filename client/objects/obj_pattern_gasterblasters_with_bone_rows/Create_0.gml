// Arguments: bone_instance, gasterblaster

platforms_speed = 0.5 + _power * 0.1;
sector_y_step = 35;

callback = function () {
	var _soul_pos = irandom_range(0, 2);
		
	if (_soul_pos == 0)
		soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down / 2, battle_soul_type.orange);
	if (_soul_pos == 1)
		soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);
	if (_soul_pos == 2)
		soul_instance = create_soul(border_instance.x, border_instance.y - border_instance.up / 2, battle_soul_type.orange);
		
	update();
	update_bones(_power);
	time_source_start(time_source_update);
	time_source_start(time_source_update_bones);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var position_number = irandom_range(0, 2);
	var border_distance = 180;
	switch (position_number) {
		case 0:
			create_gasterblaster(gasterblaster, border_instance.x + border_distance, border_instance.y + 28, border_instance.x, border_instance.y + 30,  270);
			break;
		case 1:
			create_gasterblaster(gasterblaster, border_instance.x + border_distance, border_instance.y, border_instance.x, border_instance.y,  270);
			break;
		case 2:
			create_gasterblaster(gasterblaster, border_instance.x + border_distance, border_instance.y - 28, border_instance.x, border_instance.y - 30,  270);
			break;
	}
}
update_bones = function() {
	var bone_speed = 1 + _power * 0.1;
	var bone_instance = create_bone(border_instance.x - border_instance.left - 4, border_instance.y - 15, bone,
		bone_speed, 2, 0, 90);
	var bone_instance = create_bone(border_instance.x + border_instance.right + 4, border_instance.y + 15, bone,
		bone_speed, 2, 180, 270);
}

var period = 65 - _power * 6;
var repeats = 5 + _power;
	
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});
	
var period = 60 - _power * 4;
time_source_update_bones = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
	update_bones();
}, [], -1);