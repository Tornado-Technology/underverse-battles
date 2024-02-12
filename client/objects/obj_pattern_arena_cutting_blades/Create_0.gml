

callback = function () {

var instance = instance_create(obj_pattern_flying_star, {
		border_instance: border_instance,
		_power: _power,
		sides: [dir.left, dir.right],
		star_spining: obj_star_spining_dream,
		custom_repeats: 16 + _power * 5,
		is_aiming: false,
		final_function: destroy,
		attack_blades : true
	}).callback();
	
	time_source_start(time_source_update);
}

update = function() {
	repeat(2) {	
		var py1 = border_instance.y - border_instance.up;
		var py2 = border_instance.y + border_instance.down;
		var rand_px1 = irandom_range(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
		var rand_px2 = irandom_range(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
		if (rand_px1 < border_instance.x - border_instance.left + 20 && rand_px2 < border_instance.x - border_instance.left + 20)
			rand_px2 += 20;
		if (rand_px1 < border_instance.x + border_instance.right - 20 && rand_px2 > border_instance.x + border_instance.right - 20)
			rand_px2 -= 20;
		var rand_dir = point_direction(rand_px1, py1, rand_px2, py2);
		var rand_dist = point_distance(rand_px1, py1, rand_px2, py2);
		audio_play_sound_plugging(snd_stab);
		instance_create_depth(rand_px1, py1, fight_depth.bullet_outside_hight, blades_swing, {
			image_angle: rand_dir,
			image_xscale: rand_dist / 64
		});
	}
}


var repeats = 4 + (_power div 2);
time_source_update = time_source_create(time_source_game, 1, time_source_units_seconds, function () {
	update();
}, [], repeats);

destroy = function() {
	instance_destroy(id);
}