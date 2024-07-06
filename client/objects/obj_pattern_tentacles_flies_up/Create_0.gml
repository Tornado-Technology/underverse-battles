// Arguments: spike,  spike_target

callback = function () {
	soul_instance = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
	 border_up = border_instance.y - border_instance.up;
	 border_down = border_instance.y + border_instance.down;
	 
	 	
	border = {
		up: border_instance.y - border_instance.up,
		down: border_instance.y + border_instance.down,
		left: border_instance.x - border_instance.left,
		right: border_instance.x + border_instance.right		
	};
	 
	update_radius_spike();
	time_source_start(time_source_update_radius_spike);
	time_source_start(time_source_update_destroy);
}

update_radius_spike = function () {
	
var speed_tentacles =  0.05; 
var tentacles_instance = [];
var border_left_right = fight_random_choose(border.left, border.right);
var border_up_down =  fight_random_choose(border.down, border.up);
	
var i = irandom(1);	
	
var coord = 
[
	fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right),
	fight_random_integer(border_instance.y - border_instance.up, border_instance.y + border_instance.down)
];

	tentacles_instance = [
		instance_create_depth(coord[0], border_up_down, fight_depth.bullet_outside_hight, tentacles, {
				image_xscale: 0,
				image_angle: point_direction(coord[0], border_up_down, coord[0], border_instance.y)
			}),
			 
		instance_create_depth(border_left_right, coord[1], fight_depth.bullet_outside_hight, tentacles, {
			image_xscale: 0,
			image_angle: point_direction(border_left_right, coord[1], border_instance.x, coord[1])
		})
	];
				 
	tentacles_instance[i].change_scale(1.4, speed_tentacles + (_power * 0.01));

} 	



var period = 50 - (_power) * 2;


time_source_update_radius_spike = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_radius_spike();	
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, (320 + 20 * _power) / 60, time_source_units_seconds, function () {
	instance_destroy();
});