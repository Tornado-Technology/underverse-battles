platforms_speed = 0.6 + _power * 0.1;

callback = function() {
	soul_instance = create_soul(border_instance.x + 15, border_instance.y + 4, battle_soul_type.blue);
			
	down_bone_count = 20;
	
	create_moving_platforms(border_instance.x + border_instance.right + 10, border_instance.y + 10, down_bone_count, 6, 60, -platforms_speed);
	
	i = 0;
		
	update();	
	time_source_start(time_source_update);
	time_source_start(time_source_update_shot);
	time_source_start(time_source_update_platforms);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var speed_bone = 1 + _power * 0.1;

	bone_instances_0[i] = create_bone(border_instance.x + border_instance.right + 10, border_instance.y + border_instance.down, bone, speed_bone, 1, 180, 0);	
	bone_instances_1[i] = create_bone(border_instance.x + border_instance.right + 10, border_instance.y - border_instance.up, bone, speed_bone, 1, 180, 180);	
	i++;
	
	if (i > 10) {
		i = 0;	
	}
}

update_shot = function() {
	var i = fight_random_integer(0, array_length(bone_instances_0) - 1);

	if (fight_random_integer(0, 1)) {
		bone_instances_0[i].move = border_instance.y - border_instance.up;
		bone_instances_0[i].moving = true;
	} else  {
		bone_instances_1[i].move = border_instance.y + border_instance.down;
		bone_instances_1[i].moving = true;	
	}
	
	audio_play_sound_plugging(snd_spare_up);
}

update_platforms = function() {
	create_next_moving_platform(border_instance.x + border_instance.right + 10, border_instance.y + 10, down_bone_count, 6, 60, -platforms_speed);
}

var period = 43 - (_power * 3);
var repeats = 8 + _power * 3;

time_source_update = time_source_create(time_source_game,  1 / (6 + _power), time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_shot = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	update_shot();
}, [], repeats);

time_source_update_platforms = time_source_create(time_source_game, 1 / platforms_speed, time_source_units_seconds, function () {
	update_platforms();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, period / 60 * (repeats + 1) + 1, time_source_units_seconds, function () {
	instance_destroy();	
});
