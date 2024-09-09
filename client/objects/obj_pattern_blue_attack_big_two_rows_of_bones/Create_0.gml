// Arguments: bone, gasterblaster, custom_repeats (optional)

bone_instances = [];
bone_count = 4;

callback = function() {
	soul_instance =  create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
	time_source_start(time_source_gasterblaster);	
}

update = function() {
	var bone_scale = 5;
	var bone_speed = 1.3;
	create_bone(border_instance.x + border_instance.right + 10, border_instance.y - border_instance.up - 15, bone, bone_speed, bone_scale, 180, 180);
	create_bone(border_instance.x - border_instance.left - 10, border_instance.y + border_instance.down + 15, bone,	bone_speed, bone_scale, 0, 0);
}

update_gasterblaster = function() {
	var position_x = fight_random_choose(border_instance.x - border_instance.left - 10, border_instance.x + border_instance.right + 10);
	var position_end_x = position_x == border_instance.x - border_instance.left - 10 ? position_x / 90 : position_x + 50;
	var position_y = soul_instance.y;
	var angle = position_x == border_instance.x - border_instance.left - 10 ? 90 : 270;
	
	create_gasterblaster(gasterblaster, position_end_x, position_y, position_x, position_y, angle,  1/8, 1 - _power * 0.1, 15/60, 1/6);
}

var period = 60 - _power * 2;
var repeats = 5 + _power * 2;
var period_gasterblaster = 80 - _power * 5;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	update();
}, [], -1);
	
time_source_gasterblaster = time_source_create(time_source_game, period_gasterblaster / 60, time_source_units_seconds, function() {
	update_gasterblaster();
}, [], repeats - 1);	
	
time_source_update_destroy = time_source_create(time_source_game, period_gasterblaster * (repeats + 1) / 60, time_source_units_seconds, function() {
	instance_destroy();
});