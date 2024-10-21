//Arguments: bomb, slime

callback = function () {
	create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	var time = 0.01 + (_power > 2 ? 0.01 : 0);
	var border_down = border_instance.y + border_instance.down;
	
	var slime_instnace = instance_create_depth(border_instance.x, border_down, fight_depth.bullet_outside_hight, slime, {
		image_xscale: 10
	});
	slime_instnace.change_scale(border_instance.y - border_instance.up, time);

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};

update = function () {	
	var random_position = 0;
	var offset_x = 25;
	
	var border_up = border_instance.y - border_instance.up;
	if (fight_random_integer(0, 1)) {
		var start_x = border_instance.x - border_instance.right - 10;
		random_position = start_x - fight_random_integer(offset_x, offset_x * 2);
	} else {
		var start_x = border_instance.x + border_instance.left + 10;
		random_position = start_x + fight_random_integer(offset_x, offset_x * 2);
	}

	var bomb_instnace = create_bone(random_position,  border_up, bomb, 4, 1, 270, 1);
	
	bomb_instnace.draw_no_arena = true;
	bomb_instnace.spike_count = 3;
	bomb_instnace.speed_const = 2.4 + _power * 0.1;
	bomb_instnace.target_position = new Vector2(bomb_instnace.x, border_instance.y + border_instance.down + fight_random_integer(-100, 50));
}
 
var period = 34 - (_power * 2);
var repeats = 12 + (_power * 2);

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 2, time_source_units_seconds, function () {
	instance_destroy();
});