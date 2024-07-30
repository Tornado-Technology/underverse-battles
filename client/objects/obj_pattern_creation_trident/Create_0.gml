// Arguments:  thread_tentacles, spike
callback = function () {
	soul_instance = create_soul(border_instance.x + 30, border_instance.y, battle_soul_type.red);
	

	update();
	spwan_create = true;
	time_source_start(time_source_update);
	time_source_start(time_source_update_creation);
	time_source_start(time_source_update_destroy);
}

update = function () { 
	var cood = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
	
	var spike_instance = instance_create_depth(cood, border_instance.y + border_instance.down, fight_depth.bullet_outside_hight, obj_tentacles_destroy_back_nightmare, {
		image_angle: 90,
		image_xscale: 0
	});
	
	spike_instance.change_scale(2 + _power * 0.1, 0.05);
}

update_creation = function () {
	var offset = 50;
	var position_x = fight_random_choose(border_instance.x - border_instance.left - offset, border_instance.x + border_instance.right + offset);
	var position_y = border_instance.y - border_instance.up - 10;
	var creation_instance = instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, creation, {
		speed_const: 2 + _power * 0.1	
	});
		
	var target = new Vector2(position_x, room_height);
	creation_instance.target_position = target;	
}


var period = 45 -  (_power * 2);
var period_creation = 60 - (_power);
var repeats = 10 + _power * 2;


time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
}, [], repeats - 1);

time_source_update_creation = time_source_create(time_source_game, period_creation / 60, time_source_units_seconds, function () {
	update_creation();	
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game,  (period * repeats) / 60, time_source_units_seconds, function () {
	instance_destroy();	
});