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
	var cood = rand_side_from(border_instance.x - border_instance.left - offset, border_instance.y - border_instance.up - offset, border_instance.x + border_instance.right + offset, border_instance.y + border_instance.down + offset);
	var creation_instance = instance_create_depth(cood[0], cood[1], fight_depth.bullet_outside_hight, creation, {
		speed_coust: 2 + _power * 0.1	
	});
		
	var target = new Vector2(soul_instance.x, soul_instance.y);
	creation_instance.target_position = target;	
}


var period = 44 - (2 - _power) * 2;
var repeats = 10 + _power * 0.5;
var cooldown = 32 - (2 - _power) * 2;

time_source_cooldown = time_source_create(time_source_game, cooldown / 60, time_source_units_seconds, function () {
	spwan_create = true;	
	time_source_start(time_source_update_creation);
})

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
}, [], -1);

time_source_update_creation = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	if (spwan_create) {
		update_creation();	
		spwan_create = false;
		time_source_start(time_source_cooldown);	
	};

});

time_source_update_destroy = time_source_create(time_source_game,  period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();	
});