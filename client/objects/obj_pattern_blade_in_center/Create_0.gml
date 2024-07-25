// Arguments: blades_swing

callback = function () {
	soul_instance = create_soul(border_instance.x - 30, border_instance.y - 30, battle_soul_type.orange);
	
	center_blade = instance_create_depth(border_instance.x, border_instance.y, fight_depth.bullet_outside, blades_swing);
	 
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var offset = 25;
	var spd = 2 + _power * 0.1;

	var coord = rand_side_from(border_instance.x - border_instance.left - offset, border_instance.y - border_instance.up - offset, border_instance.x + border_instance.right + offset, border_instance.y + border_instance.down + offset);

	var blades_instance = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, blades_swing, {
		image_angle: point_direction(coord[0], coord[1], soul_instance.x, soul_instance.y) + 225,
		side: -1,
		angle_speed_const: 1
	});	
	
	center_blade.move_spinning(spd);
	blades_instance.swing(14);
	blades_instance.speed_const = spd;
}

var period = 40 - 2 * _power;
var repeats = 7 + _power;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, repeats * period / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();	
});