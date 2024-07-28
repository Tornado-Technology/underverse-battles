/// Arguments: bone, thread
callback = function () {
	create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	repeat(3) {
		var position_x = room_width / 24;
		var position_end_x = border_instance.x + border_instance.right + 30;
		var position_y = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 10);
	
		var thread_instance = instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, thread);	
		thread_instance.capture_obj = bone;
		thread_instance.target_x = position_end_x;
		thread_instance.target_y = position_y;
		thread_instance.scale_speed = 5 + _power * 0.1;
	}
}


var period = 50 - (_power * 2);
var repeats = 5 + (_power * 2);

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 1, time_source_units_seconds, function() {
	instance_destroy();	
})