// Arguments: blades_swing

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	 
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
var spd = 3 + _power * 0.2;

var	coord = [soul_instance.x, border_instance.y - border_instance.up - 20, border_instance.y + border_instance.down + 20];
	if (irandom_range(0, 1)){
		var blades_instance = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, blades_swing, {
			image_angle: point_direction(coord[0], coord[1], soul_instance.x, soul_instance.y) + 225,
			angle_speed_const: -1,	
			side: 1
		});	
	}
	else {
		var blades_instance = instance_create_depth(coord[0], coord[2], fight_depth.bullet_outside_hight, blades_swing, {
			image_angle: point_direction(coord[0], coord[2], soul_instance.x, soul_instance.y) + 225,
			angle_speed_const: 1,	
			side: 3
		});	
	};

	blades_instance.swung(12 + spd);	
	blades_instance.speed_const = spd;
}

var period = 33 - 2 * _power;
var repeats = 14 + (_power * 2);

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, repeats * period / 60, time_source_units_seconds, function () {
	instance_destroy();	
});