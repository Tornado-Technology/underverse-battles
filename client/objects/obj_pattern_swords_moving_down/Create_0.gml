/// Arguments: scythe, swords
callback = function () {
	soul_instance = create_soul(border_instance.x - border_instance.left + 20, border_instance.y, battle_soul_type.red); 


	if(fight_random_integer(0, 1)) {
		update();
	} else {
		update_scythe();
	};
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}


update_scythe = function () {
	var position_x;
	var position_y;
	var center_x;
	var center_y;
	var finish_x;
	var finish_y;
	var center;
	var scythe_instance;
	var angle;


	position_x = fight_random_integer(border_instance.x - border_instance.left + 10, border_instance.x + border_instance.right - 10);
	position_y = border_instance.y - border_instance.up - 40;
  
	angle = point_direction(position_x, position_y, position_x, border_instance.y) + 190;

	
	 scythe_instance = instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, scythe, {
		speed_count: 3 + _power * 0.1,
		speed: 3 + _power * 0.1,
		direction: 280,
		image_angle: angle
	 });
}


update = function () {
	var position_x;
	var position_y;
	var position; 
	var angle;
	
	
	position_x = fight_random_integer(border_instance.x - border_instance.left + 10, border_instance.x + border_instance.right - 10);
	position_y = border_instance.y - border_instance.up - 40	
	position = new Vector2(position_x,  border_instance.y + border_instance.down + 120);
	angle = point_direction(position_x, position_y, position_x, border_instance.y);
	
	
	var swords_instance = instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, swords, {
		speed_count: 3 + _power * 0.1,
		image_xscale: -1
		
	});
	
	swords_instance.disable_surface = true;
	swords_instance.step = 0.03 + _power * 0.01;
	swords_instance.gradually_appearing();
	swords_instance.image_angle = angle;
	swords_instance.target_soul(position, true);	
}

var period = 50 - (_power);

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	if(fight_random_integer(0, 1)) {
		update();
	} else {
		update_scythe();
	};
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, (280 + _power * 30) / 60, time_source_units_seconds, function () {
	instance_destroy();
});