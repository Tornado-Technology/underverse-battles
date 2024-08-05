// Arguments: brush, max_acceleration

border_instance.y += 5;

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var position_x;
	var position_y;
	var position_end_x;
	var position_end_y;
	var offset = 12;
	var random_type_position = fight_random_integer(0, 1);
	var brush_speed = 2 + _power * 0.1;
	if(random_type_position == 0) {
		position_x = fight_random_integer(border_instance._inst_frame_left.x, border_instance._inst_frame_right.x);
		position_y = fight_random_choose(border_instance._inst_frame_up.y - offset, border_instance._inst_frame_down.y + offset);
		position_end_x = position_x > border_instance.x ? border_instance.x - border_instance.left : border_instance.x + border_instance.right;
		position_end_y = position_y == border_instance._inst_frame_up.y - offset ?  border_instance.y + border_instance.down + offset : border_instance.y - border_instance.up - offset; 
	} else if (random_type_position == 1) {	
		position_x = fight_random_choose(border_instance._inst_frame_left.x - offset, border_instance._inst_frame_right.x + offset);
		position_y = fight_random_integer(border_instance._inst_frame_up.y + 10, border_instance._inst_frame_down.y - 10);
		position_end_x =  position_x > border_instance.x ? border_instance.x - border_instance.left - offset : border_instance.x + border_instance.right + offset;
		position_end_y = position_y;
	}; 
	
 	instance_create_depth(position_x, position_y, fight_depth.bullet_outside, brush, {
		position_x: position_end_x,
		position_y: position_end_y,
		speed_const: brush_speed,
		random_type_position: random_type_position,
		offset: offset
	});	
	
		
}


var period = 85 - _power * 8;
var repeats = 6 + _power;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);


time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});