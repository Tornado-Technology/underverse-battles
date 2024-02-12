// bone_rotating

callback = function () {
soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);	
	
	var bone = 	create_changing_bone(border_instance.x, border_instance.y, obj_bone_changing_papyrus, 0, 1, 180, 20, 3);
	
	bone.call_repeat_all();
	var bone = 	create_changing_bone(border_instance.x - 20, border_instance.y, obj_bone_changing_papyrus, 0, 1, 180, 20, 3);
	
	bone.call_repeat_all();
	
	update();
	time_source_start(time_source_update);
	//time_source_start(time_source_update_destroy);
}

update = function () {	

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