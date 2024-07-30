// Arguments: brush, max_acceleration

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_brush);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var offset = 70;
	var postiton_x = fight_random_choose(border_instance._inst_frame_left.x, border_instance._inst_frame_right.x);
	var postiton_y = fight_random_choose(border_instance._inst_frame_up.y, border_instance._inst_frame_down.y);
	var position_end_x= postiton_x == border_instance._inst_frame_left.x ? border_instance.x + border_instance.right :   border_instance.x - border_instance.left
	var position_end_y = postiton_y == border_instance._inst_frame_up.y ?  border_instance.y + border_instance.down : border_instance.y - border_instance.up; 
 	instance_create_depth( postiton_x, postiton_y, fight_depth.bullet_outside, brush, {
		position_x: position_end_x,
		position_y: position_end_y,
		speed_const: 3 + _power * 0.1
	});	
	
		
}

update_brush = function () {
	var coord = [];
	coord = rand_side_from(border_instance.x - border_instance.left - 8, border_instance.y - border_instance.up - 8, border_instance.x + border_instance.right + 8, border_instance.y + border_instance.down + 8);
	create_broomie(coord[0], coord[1], obj_brush_ink_sans,
		point_direction(coord[0], coord[1], soul_instance.x, soul_instance.y) + 225, -1, -1, max_acceleration);	
}

var period = 85 - _power * 10;
var period_brush = 85 - _power * 10;
var repeats = 6 + _power;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_brush = time_source_create(time_source_game, period_brush / 60, time_source_units_seconds,function () {
	update_brush();
}, [],  repeats -1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});