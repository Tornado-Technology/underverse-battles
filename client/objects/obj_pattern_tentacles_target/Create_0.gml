//Arguments: tentacles, custom_repeats (optional)

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};

update = function () {
	
	var offset_x = border_instance.x - border_instance.left + irandom_range(50 , 100);
	var offset_y = border_instance.y - border_instance.up - irandom_range(30, 90);

	var tentacles_instance = create_bone(offset_x , offset_y, bone_explsoin, 4, 1, 270, 1);
	tentacles_instance.time_explsoin = 30 - _power * 3;
 };
 
var period = 33 - 2 * _power;
var repeats = 5 + _power * 2;


time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1.5, time_source_units_seconds, function () {
	instance_destroy();
});