/// Arguments: swords

callback = function() {
	var soul_offset_x = fight_random_choose(-border_instance.left + 20, border_instance.right - 20);
	var soul_offset_y = fight_random_choose(-border_instance.up + 20, border_instance.down - 20);
	soul_instance = create_soul(border_instance.x + soul_offset_x, border_instance.y + soul_offset_y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var start_position_x;
	var start_position_y;
	var position_x;
	var position_y;
	var angle;
	var offset = 25;
	
	if (fight_random_integer(0, 1)) {
		position_x = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
		position_y = fight_random_choose(border_instance.y - border_instance.up - offset, border_instance.y + border_instance.down + offset);
				
		angle = point_direction(position_x, position_y, position_x, border_instance.y);		
		
		start_position_x = border_instance.x - border_instance.left - offset & position_y;
		start_position_y = position_y ==  border_instance.y - border_instance.up - offset ?  border_instance.y - border_instance.up - 50 : border_instance.y + border_instance.down + 30; 
	} else {
		position_x = fight_random_choose(border_instance.x - border_instance.left - offset, border_instance.x + border_instance.right + offset);
		position_y = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 10);
		angle = point_direction(position_x, position_y, border_instance.x, position_y);
		
		start_position_x = position_x;
		start_position_y = position_x == border_instance.x - border_instance.left - offset  ? border_instance.y - border_instance.up - 100 : border_instance.y + border_instance.down + 100;
	}
	
	var swords_instance = instance_create_depth(start_position_x, start_position_y, fight_depth.bullet_outside, swords, {
		speed_count: 3 + _power * 0.3
	});
	swords_instance.step = 0.02 + _power * 0.01;
	swords_instance.gradually_appearing();
	swords_instance.disable_surface = true;
	swords_instance.moving_target(position_x, position_y, angle);
	swords_instance.image_angle = angle + 180;
}

var period  = 30 - (_power * 2);
var repeats = 15 + (_power * 2);

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});