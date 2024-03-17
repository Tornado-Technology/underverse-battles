//Arguments: bomb, slime

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	var time = 0.1 + _power * 0.01;
	var border_down = border_instance.y + border_instance.down;
	
	var slime_instnace = instance_create_depth(border_instance.x, border_down, fight_depth.bullet_outside, slime, {
		image_xscale: round((border_instance.left + border_instance.right))
	});
	
	slime_instnace.change_scale(10, time);

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};

update = function () {	
	var random_position = 0;
	var offset_x = 25;
	
	var border_up = border_instance.y - border_instance.up;
	if (!irandom_range(0, 1)) {
		var start_x = border_instance.x - border_instance.right - 10;
		random_position = start_x - irandom_range(offset_x, offset_x * 2);
	} else {
		var start_x = border_instance.x + border_instance.left + 10;
		random_position = start_x + irandom_range(offset_x, offset_x * 2);
	}

	var bomb_instnace =  create_bone(random_position,  border_up, bomb, 4, 1, 270, 1);
	
	bomb_instnace._power = _power;
	bomb_instnace.spike_count = _power > 1 ?  _power + 4 :  _power + 2;
	bomb_instnace.speed_const = 3 + _power * 0.1;
	bomb_instnace.target_position =  border_instance.y + border_instance.down + irandom_range(-125, 50);
 }
 
var period =  33 - 2 - ( _power > 1 ?   _power * 4 :  _power * 2);
var repeats = 15 + _power * 5;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy(slime);
	instance_destroy();
});