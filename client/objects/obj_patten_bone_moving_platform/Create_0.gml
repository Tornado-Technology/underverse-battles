
platforms_speed = 0.5 + _power * 0.2;
callback = function () {
	soul_instance = create_soul(border_instance.x + 15, border_instance.y + 4, battle_soul_type.blue);
			
	down_bone_count = 20;
	
	create_moving_platforms(border_instance.x + border_instance.right + 10, border_instance.y + 10, down_bone_count, 6, 60, -platforms_speed);
	
	i = 0;
	shot = false;
		
	update();	
	time_source_start(time_source_update);
	time_source_start(time_source_update_platforms);
	time_source_start(time_source_destroy_update);
}


update = function () {
	var speed_bone = 1 + _power * 0.1;

	bone_counst_0[i] = create_bone(border_instance.x + border_instance.right + 10, border_instance.y + border_instance.down, bone, speed_bone, 1, 180, 0);	
	bone_counst_1[i] = create_bone(border_instance.x + border_instance.right + 10, border_instance.y - border_instance.up, bone, speed_bone, 1, 180, 180);	
	i++;
	
	if (i > 10) {
		i = 0;	
	}
	
};

update_shot = function () {
	var i = irandom(array_length(bone_counst_0) - 1);

	if (irandom(1)) {
		bone_counst_0[i].move = border_instance.y - border_instance.up;
		bone_counst_0[i].moving = true;
	}
	else  {
		bone_counst_1[i].move = border_instance.y + border_instance.down;
		bone_counst_1[i].moving = true;	
	};	
	
	shot = true;
	audio_play_sound_plugging(snd_spare_up);
	time_source_start(time_source_out_shot);
}

update_platforms = function() {
	create_next_moving_platform(border_instance.x + border_instance.right, border_instance.y + 10, down_bone_count, 6, 60, -platforms_speed);
}

var period = 35 - (2 - _power) * 2;
var repeats = 15 + _power * 3;


time_source_update = time_source_create(time_source_game,  1 / (6 + _power), time_source_units_seconds, function () {
	update();	
	if (!shot) {
		time_source_start(time_source_update_shot);
	};
}, [], -1);

time_source_update_shot = time_source_create(time_source_game, 1 / 3, time_source_units_seconds, function (bone_old, bone_new) {
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
