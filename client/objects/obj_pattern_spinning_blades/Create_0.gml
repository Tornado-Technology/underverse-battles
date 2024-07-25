// Arguments: blades_swing

border_instance.y += 15;
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	 
	update(); 
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var spd = 3 + _power * 0.2;
	var blades_instance;
	var offset = 40;

	var	coord = [soul_instance.x, border_instance.y - border_instance.up - offset, border_instance.y + border_instance.down + offset];
	var coord_2 = [border_instance.x - border_instance.left - offset, border_instance.x + border_instance.right + offset, soul_instance.y];
	var type = fight_random_integer(0, 3);

	if (type == 0) {
		 blades_instance = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, blades_swing, {
			angle_speed_const: -1,	
			side: 1
		});	
	} else if (type == 1) {
		 blades_instance = instance_create_depth(coord[0], coord[2], fight_depth.bullet_outside_hight, blades_swing, {
			angle_speed_const: 1,	
			side: 3
		});	
	} else if (type == 2) {
		 blades_instance = instance_create_depth(coord_2[0], coord_2[2], fight_depth.bullet_outside_hight, blades_swing, {
			angle_speed_const: 1,	
			side: 0
		});	
	} else if (type == 3) {
		 blades_instance = instance_create_depth(coord_2[1], coord_2[2], fight_depth.bullet_outside_hight, blades_swing, {
			angle_speed_const: 1,	
			side: 2
		});	
	};
	
	blades_instance.image_angle =  point_direction(blades_instance.y, blades_instance.y, soul_instance.x, soul_instance.y) + 225;
	blades_instance.swing(12 + spd);	
	blades_instance.speed_const = spd;
}

var period = 35 - 2 * _power;
var repeats = 8 + (_power * 2);

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, repeats * period / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();	
});