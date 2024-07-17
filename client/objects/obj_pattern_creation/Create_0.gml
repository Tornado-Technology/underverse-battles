// Arguments:  thread_tentacles, spike
callback = function () {
	soul_instance = create_soul(border_instance.x + 30, border_instance.y, battle_soul_type.red);
	

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () { 
 var cood = rand_side_from(border_instance.x - border_instance.left - 40, border_instance.y - border_instance.up - 40, border_instance.x + border_instance.right + 40, border_instance.y + border_instance.down + 40);
 var target = new Vector2(soul_instance.x, soul_instance.y);
 var tentacles_instance = instance_create_depth(cood[0], cood[1], fight_depth.bullet_outside_hight, tentacles, {
	speed_coust: 2 + _power * 0.1	
 });
		
		
	tentacles_instance.target_position = target;
}


var period = 36 - 2 -  _power * 2;
var repeats = 15 + _power * 3;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
},[], -1);


time_source_update_destroy = time_source_create(time_source_game,  period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();	
})