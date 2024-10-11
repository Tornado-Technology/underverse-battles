// Arguments bow, arrow

callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);	
	time_source_start(time_source_update_orange);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var position_x = (border_instance.x - border_instance.left);
	var position_y = fight_random_choose(border_instance.y - border_instance.up - 20,  border_instance.y + border_instance.down + 20);
	var direction_start = (position_y > border_instance.y ? 90 : 270);
	var offset = fight_random_integer(40, 80);
	var i = 0;
	repeat(4) {
		var star_instance = instance_create_depth(position_x + 20 + offset * i, position_y, fight_depth.bullet_outside, obj_star_change_trajectory_dream, {
			direction: direction_start	
		});
		
		star_instance.speed_const = 0.7 + _power * 0.1;
		i++;
	}
}	

update_orange = function() {
	var position_x = fight_random_choose(border_instance.x - border_instance.left - 30, border_instance.x + border_instance.right + 30);
	var position_y = soul_instance.y;
	var target = point_direction(position_x, position_y, border_instance.x, position_y);	
	var can_ricochet = fight_random_integer(1, 100) <= (15 + _power * 10);
	var speed_bow = 4 + _power * 0.1;
	create_bow(bow, arrows_orange, speed_bow, can_ricochet, position_x, position_y,  target, 1 / 6,  0.6 - _power * 0.1,  0.5 - _power * 0.1);
}

var period = 40;
var period_orange = 45 - (_power * 2);
var repeats = 12 + (_power * 3);

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	update();	
}, [], repeats - 2);

time_source_update_orange = time_source_create(time_source_game, period_orange / 60, time_source_units_seconds, function() {
	update_orange();	
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game,  (period_orange * repeats) / 60 + 1, time_source_units_seconds, function() {
	instance_destroy();	
});	
	