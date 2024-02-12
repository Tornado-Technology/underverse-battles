// Arguments: blades_swing

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	 
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
var spd = 3 + _power * 0.2;
var offset = 30;


var	coord = rand_side_from(border_instance.x - border_instance.left - offset, border_instance.y - border_instance.up - offset, border_instance.x + border_instance.right + offset, border_instance.y + border_instance.down + offset);

	var  blades_instance = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, blades_swing, {
	angle_speed_const: -1,	
	side: -1
	});	
		
	blades_instance.image_angle = point_direction(blades_instance.x, blades_instance.y, soul_instance.x, soul_instance.y);
	blades_instance.swung(12 + spd);
	blades_instance.waves();
	blades_instance.speed_const = spd;
}

var period = 33 - 3 * _power;
var repeats = 14 + (_power div 2);

time_source_update = time_source_create(time_source_game, period / 30, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, repeats * period / 60, time_source_units_seconds, function () {
	instance_destroy();	
});