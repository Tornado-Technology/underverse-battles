//Arguments: bomb

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};

update = function () {
	var target_position = irandom_range(0, 100)
	var offset_x = border_instance.x - border_instance.left + target_position;
	var offset_y = border_instance.y - border_instance.up;
	var spd = 2 + _power * 0.4;

	var tentacles_instance = create_bone(offset_x , offset_y, bomb, spd, 1, 270, 1);
	tentacles_instance.target_position = border_instance.y + border_instance.down - target_position;
 };
 
var period = 33 - 2 - _power * 2;
var repeats = 5 + _power * 2;


time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});