event_inherited();
spike_count = 8;

damage = get_char_damage(obj_character_nightmare);

spwan = function () {
if (_power > 1) {
		var angle = 360 / spike_count;
		var i = angle;
		
		while(i <= 360) {
			var spike_instance = instance_create_depth(x + dcos(i), y + -dsin(i), fight_depth.bullet_outside_hight, obj_spike_1_nightmare, { image_angle : i});	
			spike_instance.speed_const = speed_const;
			i += angle;	
		}	
	}
else {
		var angle = 90 / spike_count;
		var i = 0;
		var j = 0;
	
		while (i < 120) {
			var spike_instance = instance_create_depth(x + dcos(i), y + -dsin(i), fight_depth.bullet_outside_hight, obj_spike_1_nightmare);
			spike_instance.image_angle = point_direction(spike_instance.x, spike_instance.y, obj_battle_soul.x, obj_battle_soul.y) + j; 	
			spike_instance.speed_const = speed_const;
			i += angle;	
			j += 10;
		}
	}
}
