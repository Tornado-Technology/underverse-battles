
platforms_speed = 0.5 + _power * 0.1;
callback = function () {
	soul_instance = create_soul(border_instance.x + 15, border_instance.y - border_instance.up + 5, battle_soul_type.blue);
	
	i = 0;
	distances_platforms = 0;
	
	move_right = true;
	shot = false;

	down = 20;
	
	spwan_platform = function () {
		var i = 0;
		repeat (4) {
			platforms_instance = create_moving_platforms(border_instance.x - border_instance.left + 15 + 40 * i, border_instance.y - border_instance.up + down, 1, 5, 60, -platforms_speed);
			platforms_instance[0]._angle = 90;
			i++;
		}
		down += down == 0 ? 0 : -5;
	}
	
	spwan_platform();
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_platforms);
	time_source_start(time_source_destroy_update);
}

update = function () {
	var speed_bone = 1 + _power * 0.1;

	var bone_counst = create_bone(border_instance.x + border_instance.right + 1, border_instance.y + border_instance.down, bone, speed_bone, 1, 180, 0);	
	
	bone_counst.destroy_left = true;
}

update_shot = function () {
	var i = fight_random_integer(0, instance_number(bone));
		bone_instances_0[i] = instance_find(bone, i);
		if (variable_instance_exists(bone_instances_0[i], "direction")) {
			bone_instances_0[i].direction = 90;
		}
	shot = true;
	audio_play_sound_plugging(snd_spare_up);
	time_source_start(time_source_out_shot);
}

update_platforms = function() {
	spwan_platform();
}

var period = 35 - (2 - _power) * 2;
var repeats = 15 + _power * 3;


time_source_update = time_source_create(time_source_game,  1 / (6 + _power), time_source_units_seconds, function () {
	update();	
	
	if (!shot) {
		time_source_start(time_source_update_shot);
	};
	
}, [], -1);

time_source_update_shot = time_source_create(time_source_game, 1 / 3, time_source_units_seconds, function () {
	update_shot();
});

time_source_out_shot = time_source_create(time_source_game, 1 / (1 + _power), time_source_units_seconds, function() {
	shot = false;	
})

time_source_update_platforms = time_source_create(time_source_game, 1 / platforms_speed, time_source_units_seconds, function () {
	update_platforms();	
}, [], -1);	
		

time_source_destroy_update = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();	
});
