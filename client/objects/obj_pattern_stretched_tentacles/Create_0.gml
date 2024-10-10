//Arguments: tentacle, custom_repeats (optional)

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	shot = true;
	
	tentacles_instance = [
		instance_create_depth(border_instance.x - 10, border_instance.y - border_instance.up, fight_depth.bullet_outside_hight, obj_stretched_tentacles_nightmare, {
			direction: 180,
			speed_count: 2 + _power * 0.1,
			time_state: 20,
			time_return: 35,
			scale_time: _power * 0.1,
			scale_const: -2
		})
		,
		instance_create_depth(border_instance.x + 10, border_instance.y - border_instance.up, fight_depth.bullet_outside_hight, obj_stretched_tentacles_nightmare, {
			direction: 0,
			speed_count: 2 + _power * 0.1,
			time_state: 20,
			time_return: 35,
			scale_time: _power * 0.1,
			scale_const: -2
		})
	];
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_tentacles);
	time_source_start(time_source_update_destroy);
};

update_tentacles = function () {
	var speed_tentacles =  0.05; 
	var tentacles_instance = instance_create_depth(soul_instance.x, border_instance.y + border_instance.down, fight_depth.bullet_outside_hight, obj_tentacle_destroy_back_nightmare, {
		image_xscale: 0,
		image_angle: 90
	});
		tentacles_instance.change_scale(1.3, speed_tentacles);
}

update = function () {
	
	

 };
 
update_shot = function () {
	var i = fight_random_integer(0, 1);
	time_source_start(tentacles_instance[i].time_source_state);
	shot = false;
};
 
var period = 33 - 2 * _power;
var repeats = 5 + _power * 2;

var cooldown = 60 - (_power * 2);

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
};

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
	time_source_start(shot ? time_source_update_shot : time_source_cooldown);
}, [], -1);

time_source_update_tentacles = time_source_create(time_source_game, (period + 20) /  60, time_source_units_seconds, function () {
	update_tentacles();	
}, [], -1);

time_source_cooldown = time_source_create(time_source_game, cooldown / 60, time_source_units_seconds, function () {
	shot = true;		
});

time_source_update_shot = time_source_create(time_source_game, 1/3, time_source_units_seconds, function (bone_old, bone_new) {
	update_shot();
});


time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1.5, time_source_units_seconds, function () {
	instance_destroy();
});