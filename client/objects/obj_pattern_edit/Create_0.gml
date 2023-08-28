// Arguments: bone, spike, knife_spin, knife_directed, gasterblaster_aiming, gasterblaster_aiming_solo

edit_button = noone;
editing_object = [];
gasterblaster_solo_instance = noone;

step = 6;
_side = 90;
rot = irandom_range(0, 1);

callback = function () {
	soul_instance = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
	
	edit_button = instance_create(obj_edit_button_green);

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_stop);
}

update = function() {
if (!instance_exists(edit_button)) return;
switch (edit_button.edit_attack_number) {
	case 0:
		var coord = rand_side_from(border_instance.x - border_instance.left - 20, border_instance.y - border_instance.up - 20, border_instance.x + border_instance.right + 20, border_instance.y + border_instance.down + 20);
		var spike_direction = point_direction(coord[0], coord[1], soul_instance.x, soul_instance.y);
		var spike_instance = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, spike);
		spike_instance.speed_const = 2.6;
		spike_instance.direction = spike_direction;
		spike_instance.image_angle = spike_direction;
		array_push(editing_object, spike_instance);
		audio_play_sound_plugging(snd_projectile);
		break;
	case 1:
		var side = irandom_range(0, 1);
		var x_rand;
		var bone_direction = 0;
		if (side == 0) {
			x_rand = border_instance.x - border_instance.left - 10;
			spike_direction = 0;
		}
		else {
			x_rand = border_instance.x + border_instance.right + 10;
			spike_direction = 180;
		}
		var y_rand = irandom_range(border_instance.y - border_instance.up, border_instance.y + border_instance.down - 10);
		var spike_instance = instance_create_depth(x_rand, y_rand, fight_depth.bullet_outside_hight, spike);
		spike_instance.speed_const = 2.6;
		spike_instance.direction = spike_direction;
		spike_instance.image_angle = spike_direction;
		array_push(editing_object, spike_instance);
		audio_play_sound_plugging(snd_projectile);
		break;
	case 2:
		var coord = rand_side_from(border_instance.x - border_instance.left - 20, border_instance.y - border_instance.up - 20, border_instance.x + border_instance.right + 20, border_instance.y + border_instance.down + 20);
		var bone_direction = point_direction(coord[0], coord[1], soul_instance.x, soul_instance.y);
		var bone_instance = create_bone(coord[0], coord[1], bone, 2.6, 1, bone_direction, bone_direction - 90);
		array_push(editing_object, bone_instance);
		audio_play_sound_plugging(snd_projectile);
		break;
	case 3:
		var side = irandom_range(0, 1);
		var x_rand;
		var bone_direction = 0;
		if (side == 0) {
			x_rand = border_instance.x - border_instance.left - 10;
			bone_direction = 0;
		}
		else {
			x_rand = border_instance.x + border_instance.right + 10;
			bone_direction = 180;
		}
		var y_rand = irandom_range(border_instance.y - border_instance.up, border_instance.y + border_instance.down - 10);
		var bone_instance = create_bone(x_rand, y_rand, bone, 2.6, 1, bone_direction, bone_direction - 90);
		array_push(editing_object, bone_instance);
		audio_play_sound_plugging(snd_projectile);
		break;
	case 4:
		var va_x1_ = obj_camera.camera_position.x;
		var va_x2_ = obj_camera.view_width + obj_camera.camera_position.x;
		var va_y1_ = obj_camera.camera_position.y;
		var va_y2_ = obj_camera.view_height + obj_camera.camera_position.y;
		var rX = irandom_range(va_x1_ + 64, va_x2_ - 64);
		var rY = irandom_range(va_y1_ + 24, va_y2_ - 24);
		while(point_in_rectangle(rX, rY, border_instance.x - border_instance.left, border_instance.y - border_instance.up, border_instance.x + border_instance.right, border_instance.y + border_instance.down)) {
			var rX = irandom_range(va_x1_ + 64, va_x2_ - 64);
			var rY = irandom_range(va_y1_ + 24, va_y2_ - 24);
		}
	
		var _inst = instance_create_depth(rX, rY, 0, knife_spin);
		_inst._target_angle = point_direction(_inst.x, _inst.y, soul_instance.x, soul_instance.y);
		array_push(editing_object, _inst);
		break;
	case 5:
		var dist_ = 120;
		var step_angle = 0;
		repeat (2) {
			var alpha = (_side + step_angle);
			var rX = border_instance.x - dist_ * dcos(alpha);
			var rY = border_instance.y - dist_ * dsin(alpha);
					
			var _knife = instance_create_depth(rX, rY, 0, knife_directed);
			_knife.image_alpha = 0;
			_knife._target_angle = point_direction(rX, rY, border_instance.x, border_instance.y);
			array_push(editing_object, _knife);
					
			step_angle += 90;
		}
		if (rot == 0)
			_side += step;
		else
			_side -= step;
		break;
	case 6:
		if (gasterblaster_solo_instance == noone) {
			var period = 35;
			var gb_size = 60;
			var con = room_height + gb_size;
			var coord = rand_side_from(-gb_size, -gb_size, con, con);
			gasterblaster_solo_instance = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, gasterblaster_aiming_solo, {
				target_time: (period - 10) / 60,
				charge_time: period / 60,
				destroy_time: 15 / 60
			});
			array_push(editing_object, gasterblaster_solo_instance);
		
		var coord_new = rand_side_from(border_instance.x - border_instance.left, border_instance.y - border_instance.up, border_instance.x + border_instance.right, border_instance.y + border_instance.down);
		gasterblaster_solo_instance.x_dir = coord_new[0];
		gasterblaster_solo_instance.y_dir = coord_new[1];
		gasterblaster_solo_instance.target = soul_instance;
		}
		break;
	case 7:
		create_aiming_gasterblaster(gasterblaster_aiming, soul_instance);
		break;
	}
}

var period = 7;
if (edit_button != noone) {
	if (edit_button.edit_attack_number == 6) period = 30;
	if (edit_button.edit_attack_number == 7) period = 20;
}
var final_time = 11;
	
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_stop = time_source_create(time_source_game, final_time, time_source_units_seconds, function () {
	time_source_stop(time_source_update);
	time_source_start(time_source_update_destroy);
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, 1, time_source_units_seconds, function () {
	instance_destroy();
});