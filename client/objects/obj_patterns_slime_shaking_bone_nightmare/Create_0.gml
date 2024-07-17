callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	bone_count = 13;
	
	var y_ = [border_instance.y - border_instance.up - 5, border_instance.y + border_instance.down + 5];
	
	var i = 0;
	var offset_x = 10;
	var offset_y = 10;
		repeat(bone_count) {
			bone_instances[i] = create_bone(border_instance.x - border_instance.left + 5 + (10 * i), y_[0],  bone_shaking, 0, 1, 270, 180);
			i++;	
		}
		repeat(bone_count) {
			bone_instances[i] = create_bone(border_instance.x + border_instance.right + 5 - (offset_x), y_[1],  bone_shaking, 0, 1, 90, 0);
			i++;	
			offset_x += 10;
		}
		repeat(bone_count - 3) {
			bone_instances[i] = create_bone(border_instance.x - border_instance.left + 5, y_[0] + bone_count + offset_y,  bone_shaking, 0, 1, 0, 90);
			i++;	
			offset_y += 10;
		}
		repeat(bone_count - 3) {
			bone_instances[i] = create_bone(border_instance.x + border_instance.right - 5, y_[1] - 5 - offset_y,  bone_shaking, 0, 1, 180, 270);
			i++;	
			offset_y -= 10;
		}

	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_zone);
	time_source_start(time_source_update_radius_spike);
	time_source_start(time_source_update_destroy);
}


update = function() {
	random_number = fight_random_integer(2, array_length(bone_instances) - 2);

	
	bone_moving = bone_instances[random_number];
	bone_moving.shake();
}

update_zone = function () {
	var random_position = new Vector2(fight_random_integer(border_instance.x - border_instance.left + 2, border_instance.x + border_instance.right - 2), fight_random_integer(border_instance.y - border_instance.up + 2, border_instance.y + border_instance.down - 2));
	instance_create_depth(random_position.x, random_position.y, fight_depth.bullet_outside, obj_damage_zone_warning_nightmare);
}


update_shot = function () {
	bone_moving.speed_const = 4;
	bone_instances[random_number] = create_bone(bone_moving.xstart, bone_moving.ystart, bone_shaking, 0, 0, bone_moving.direction, bone_moving.image_angle);
	bone_instances[random_number].change_scale(1, 0.1);
	audio_play_sound_plugging(snd_spare_up);
}

update_radius_spike = function () {
var border = {
	up: border_instance.y - border_instance.up,
	down: border_instance.y + border_instance.down,
	left: border_instance.x - border_instance.left,
	right: border_instance.x + border_instance.right		
};
var speed_tentacles =  0.05; 
var tentacles_instance = [];
var border_left_right = fight_random_choose(border.left, border.right);
var border_up_down =  fight_random_choose(border.down, border.up);
	
var i = fight_random_integer(0, 1);	
	
var coord = 
[
	fight_random_integer(border.left, border.right),
	fight_random_integer(border.up, border.down)
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


var period = 26 - 2 * _power;
var repeats = 15 + _power * 3;
var period_zone = 20;
var period_spike = 40 - _power;


time_source_update_shot = time_source_create(time_source_game, 1/3, time_source_units_seconds, function (bone_old, bone_new) {
	update_shot();
});


time_source_update_radius_spike = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_radius_spike();	
}, [], -1);


time_source_update_zone = time_source_create(time_source_game, period_zone / 60, time_source_units_seconds, function () {
	update_zone();	
}, [], -1);

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
	time_source_start(time_source_update_shot);
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});