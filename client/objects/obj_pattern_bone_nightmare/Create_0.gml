callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	var speed_bone = 1 + _power * 0.1;
	instance_create_depth(border_instance.x - border_instance.left - 20, border_instance.y - border_instance.up - 20, fight_depth.bullet_outside_hight, bone_spinning, {
		center_x: border_instance.x,
		center_y: border_instance.y,
		image_yscale: 2,
		step: 0.01 + _power * 0.001
	});	
	
	 instance_create_depth(border_instance.x + border_instance.right + 20, border_instance.y + border_instance.down + 20, fight_depth.bullet_outside_hight, bone_spinning, {
		center_x: border_instance.x,
		center_y: border_instance.y,
		image_yscale: 2,
		step: 0.01 + _power * 0.001
	});	
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}


update = function() {
	var bone_y = fight_random_integer(border_instance.y - border_instance.up, border_instance.y + border_instance.down);
	if (fight_random_choose(dir.left, dir.right) == dir.left) {
		create_bone(border_instance.x - border_instance.left - 10, bone_y, bone, 3 + _power * 0.1, 1, 0, 0);
	} else {
		create_bone(border_instance.x + border_instance.right + 10, bone_y, bone, 3 + _power * 0.1, 1, 180, 180);
	}
	
	audio_play_sound_plugging(snd_projectile);
}

var period = 33 - 2 * _power;
var repeats = 15 + _power * 3;


time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});