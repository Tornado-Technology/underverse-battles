event_inherited();

tentacles = obj_tentacles_destroy_spinning_nightmare;

damage = get_char_damage(obj_character_nightmare);

target_position = 0;

spwan = function () {
	if (image_alpha) {
		var angle_offset = irandom_range(true, false) ? 330 : 360;
		var angle = angle_offset / 4;
		var i = angle;
		
		while(i <= angle_offset) {
			var tentacle_instance = instance_create_depth(x + dcos(i), y + -dsin(i), fight_depth.bullet_outside_hight, tentacles, { 
					elemen: id,
					image_angle: i,
					time_destroy: 40,
					image_xscale: scale_const
				});	
		i += angle;	
		}
		image_alpha = 0;
	};
}

time_source_spwan = time_source_create(time_source_game, 20 / 60, time_source_units_seconds, spwan, [], -1);