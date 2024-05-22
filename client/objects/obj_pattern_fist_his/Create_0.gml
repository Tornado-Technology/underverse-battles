// Arguments:  thread_tentacles, spike
callback = function () {
	soul_instance = create_soul(border_instance.x + 30, border_instance.y, battle_soul_type.red);
	
	 fist_his_instance = instance_create_depth(border_instance.x - border_instance.left, border_instance.y + border_instance.down, fight_depth.bullet_outside_hight, fist_his);
	
	
	fist_his_instance.draw_no_in_arena = true;
	fist_his_instance.target_place = soul_instance;
	fist_his_instance.speed_count = 2 + _power * 0.1;

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () { 
	if (!instance_exists(fist_his_instance)) {
		 fist_his_instance = instance_create_depth(border_instance.x - border_instance.left, border_instance.y - border_instance.up, fight_depth.bullet_outside_hight, fist_his);
	
	
	fist_his_instance.draw_no_in_arena = true;
	fist_his_instance.target_place = soul_instance;
	
	fist_his_instance.speed_count = 2 + _power * 0.1;
		
	}
	
}


var period = 44 - (2 - _power) * 2;
var repeats = 10 + _power * 0.5;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game,  period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();	
});