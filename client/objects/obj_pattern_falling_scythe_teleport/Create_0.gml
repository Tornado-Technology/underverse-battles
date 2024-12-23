// Arguments: drops

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	character_instance.is_teleportation = true;
		
	if (fight_random_integer(0, 1)) {	
		update();
	} else {
		update_teleport();
	};
	
	time_source_start(time_source_update);
	time_source_start(time_source_update_teleport);
	time_source_start(time_source_update_destroy);
}

update_teleport = function () {
	var x1 = border_instance.x + border_instance.right + fight_random_integer(15, 50);
	var x2 = border_instance.x - border_instance.left - fight_random_integer(15, 50);
	var y1 = border_instance.y - border_instance.up - 40;
	var y2 = border_instance.y + border_instance.down + 40;
	var random_position = fight_random_integer(y1, y2);
	var x_ = fight_random_integer(0, 1) ? x1 : x2;
	instance_create_depth(x_ , random_position, fight_depth.bullet_outside_hight, teleport, {
		speed_count: 3 + _power * 0.1	
	});	
	
}

update = function () {
	var x0 = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);

	var scythe_instance = instance_create_depth(x0, border_instance.y - border_instance.up - 50, fight_depth.bullet_outside_hight, scythe, {
		angle: 270,
		angle_blast: 180
	});
	
	scythe_instance.speed_count = 3 + _power * 0.1;
}

var period = 50 - (_power * 2);
var period_teleport = 45 - (_power * 2);
var repeats = 5 + _power * 2; 

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_teleport = time_source_create(time_source_game, period_teleport / 60, time_source_units_seconds, function () {
	update_teleport();	
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 1, time_source_units_seconds, function () {
	character_instance.is_teleportation = false;
	instance_destroy();
});