//Arguments: bomb

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};

update = function () {
	var offset_x = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
	var offset_y = border_instance.y - border_instance.up - 50;
	var offset_new_y = fight_random_integer(offset_y + 50, border_instance.y + border_instance.down);
	var spd = 2 + _power * 0.4;

	var tentacles_instance = create_bone(offset_x , offset_y, bomb, spd, 1, 270, 1);
	var target_place =  new Vector2(tentacles_instance.x, offset_new_y);
	tentacles_instance.target_position = target_place;
 };
 
var period = 33 - (_power * 2);
var repeats = 5 + (_power * 2);


time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});