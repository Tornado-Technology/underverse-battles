// Arguments bow, arrow

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);	
	time_source_start(time_source_update_destroy);
};

	
update = function () {
	var offset_x = irandom_range(70, 90);
	var offset_y = 20;
				
	var px1 = border_instance.x - border_instance.left - offset_x;
	var px2 = border_instance.x + border_instance.right + offset_x;
	var py1 = border_instance.y - border_instance.up - offset_y;
	var py2 = border_instance.y + border_instance.down + offset_y + 10;
	
	var coord_new = rand_side_from(choose(px1, px2), choose(py1, py2), choose(px2, px1), choose(py1, py2));
	
	var bow_instance = instance_create_depth(coord_new[0] , coord_new[1], fight_depth.bullet_outside, bow, {
		target_time: 1 - _power * 0.1,
		shot_time: 0.7 - _power * 0.1 ,
		destroy_time: 0.5 - _power * 0.1,
		_power: _power,
		arrows: arrows,
		speed_const: 3 + _power * 0.3
	});

};

var period = 40 - _power * 2;
var repeats = 10 + _power;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
update();	
}, [], -1);


time_source_update_destroy = time_source_create(time_source_game,  period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();	
});	
	