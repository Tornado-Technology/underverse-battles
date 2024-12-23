event_inherited();
spike_count = 8;
disable_surface = true;
is_exploding_in_circle = false;
damage = get_char_damage(obj_character_nightmare);
image_alpha = 0;
spike = obj_spike_target_nightmare;
spwan = function () {
	if (is_exploding_in_circle) {
		var angle = 360 / spike_count;
		var i = angle;
		
		while (i <= 360) {
			var spike_instance = instance_create_depth(x + dcos(i), y + -dsin(i), fight_depth.bullet_outside_hight, spike, { 
				image_angle: i
			});
				
			spike_instance.speed_const = speed_const;
			i += angle;	
		}	
	} else {
		var angle = 90 / (spike_count - 1);
		var i = 0;
		var j = 0;
		
		while (i < 120) {
			var spike_instance = instance_create_depth(x + dcos(i), y + -dsin(i), fight_depth.bullet_outside_hight, spike);
			spike_instance.image_angle = point_direction(spike_instance.x, spike_instance.y, obj_battle_soul.x, obj_battle_soul.y) + j; 	
			spike_instance.speed_const = speed_const;
			spike_instance.disable_surface = true;
			i += angle;	
			j += 10;
		}
	};
	audio_play_sound_plugging(snd_bomb);
}

audio_play_sound_plugging(snd_emergence);
