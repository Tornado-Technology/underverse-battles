// Arguments: blades_swing

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);
	
	blades_instance_01 = instance_create_depth(border_instance.x, border_instance.y - border_instance.up - 30, fight_depth.bullet_outside_hight, blades_swing);
	blades_instance_02 = instance_create_depth(border_instance.x - border_instance.left - 50, border_instance.y, fight_depth.bullet_outside_hight, blades_swing);
	
	blades_instance_01.direction = 270;
	blades_instance_01.image_angle = 270;
	blades_instance_01.point_stop_y = border_instance.y + border_instance.down - 20;
	
	blades_instance_02.direction = 0;
	blades_instance_02.image_angle = 0;
	blades_instance_02.point_stop_x = border_instance.x + border_instance.right + 20;
	
	blades_instance_01.speed_const = 1 + _power * 0.15;
	blades_instance_02.speed_const = 1 + _power * 0.15;

	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

time_source_update = time_source_create(time_source_game, 0.1, time_source_units_seconds, function () {
	blades_instance_01.move(3 + _power * 0.2);
	blades_instance_01.target(soul_instance);
	blades_instance_02.move(3 + _power * 0.2);
	blades_instance_02.target(soul_instance);
	blades_instance_02.move_spinning();
});


var period = 32 - 2 * _power;
var repeats = 14 + _power * 3;


time_source_update_destroy = time_source_create(time_source_game, 5 + _power * 1, time_source_units_seconds, function () {
	instance_destroy();	
});