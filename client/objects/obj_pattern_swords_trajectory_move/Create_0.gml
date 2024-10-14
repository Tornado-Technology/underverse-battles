/// Arguments: swords, feathers
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red); 

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_);
	time_source_start(time_source_update_destroy);
}



update = function() {
	var offset = 40;
	var position_x = fight_random_choose(border_instance.x - border_instance.left - 20, border_instance.x + border_instance.right + 20);
	
	var swords_instance = instance_create_depth(position_x, border_instance.y - border_instance.up - offset, fight_depth.bullet_outside_hight, swords, {
		speed_const: 0.7 + _power * 0.1,
		image_xscale: position_x > border_instance.x ? 1 : -1
	});
	
	swords_instance.step = 0.08 + _power * 0.01;
	swords_instance.gradually_appearing();
	swords_instance.trajectory_move(30, 270);
}

update_ = function () {
	var offset = 40;
	var position_x = fight_random_choose(border_instance.x - 5, border_instance.x + 5);
	
	var swords_instance = instance_create_depth(position_x, border_instance.y + border_instance.down + offset, fight_depth.bullet_outside_hight, swords, {
		speed_count: 3 + _power * 0.1,
		image_angle:  270,
	});

	var position = new Vector2(position_x, -room_height);

	swords_instance.step = 0.06;
	swords_instance.gradually_appearing();
	swords_instance.disable_surface = true;
	swords_instance.target_places(position, true);
	
}

var period = (65 - _power); 
var period_swodrs = 65;
var repeats = 5 + (_power * 2);


time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	update();
}, [],  repeats - 1);

time_source_update_ = time_source_create(time_source_game, period_swodrs / 60, time_source_units_seconds, function () {
	update_();	
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 1, time_source_units_seconds, function() {
	instance_destroy();
});