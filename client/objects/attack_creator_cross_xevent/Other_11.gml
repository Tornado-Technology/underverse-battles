/// @desc Big Knife
_time++;

_power = (_power == 4) ? 5 : _power;

switch (attack_num) {
	case 0:	// Нож режет арену и кости вылетают справа и слева
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.red);
		
		if(_time % (30 - 2 * _power) == 1 and _time < 260 + 30 * _power) {
			var rand_side = irandom_range(0, 1);
			var rand_y = random_range(-_border.up + 3, _border.down - 3);
			var rand_x = -_border.left - 15;
			var rand_dir = 0;
			var rand_ang = 90;
			if (rand_side == 1) {
				rand_x = _border.right + 15;
				rand_dir = 180;
				rand_ang = 270;
			}
			create_bone(_border.x + rand_x, _border.y + rand_y, bone_obj, 2 + 0.2 * _power, 1, rand_dir, rand_ang);
		}
		
		if(_time % 60 == 30 and _time < 260 + 30 * _power) {
			var py1 = _border.y - _border.up;
			var py2 = _border.y + _border.down;
			var rand_px1 = irandom_range(_border.x - _border.left, _border.x + _border.right);
			var rand_px2 = irandom_range(_border.x - _border.left, _border.x + _border.right);
			if (rand_px1 < _border.x - _border.left + 20 && rand_px2 < _border.x - _border.left + 20)
				rand_px2 += 20;
			if (rand_px1 < _border.x + _border.right - 20 && rand_px2 > _border.x + _border.right - 20)
				rand_px2 -= 20;
			var rand_dir = point_direction(rand_px1, py1, rand_px2, py2);
			var rand_dist = point_distance(rand_px1, py1, rand_px2, py2);
			audio_play_sound_plugging(snd_stab);
			instance_create_depth(rand_px1, py1, fight_depth.bullet_outside_hight, obj_knife_swing, {
				image_angle: rand_dir,
				image_xscale: rand_dist / 64
			});
		}

		if(_time > 300 + 30 * _power)
			instance_destroy();
		break;
	
	case 1:	// Нож летает справа-слева
		_border = battle_border_create(battle_border.up - 45, battle_border.down - 45, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.red);
		
		var _sign = choose(-1, 1);
		if (knife == noone) {
			knife = instance_create_depth(_border.x - _border.left - 30, _border.y, fight_depth.bullet_outside_hight, obj_knife_cross);
			knife.speed_angle = _sign * (4 + _power * 0.2);
			knife.direction = 0;
			knife.speed = 0;
			knife.speed_max = 3 + _power * 0.2;
			knife.point_stop_x = _border.x + _border.right + 20;
			audio_play_sound_once(snd_emergence);
		}
			
		if(_time == 30) {
			knife.is_spining = true;
			knife.is_moving = true;
			audio_play_sound_once(snd_projectile);
		}
		
		if (instance_exists(knife)) {
			if (knife.step == 2) {
				if (knife.x > _border.x + _border.right + 20) {
					knife.point_stop_x = _border.x - _border.left - 20;
					knife.direction = 180;
				}
				else {
					knife.point_stop_x = _border.x + _border.right + 20;
					knife.direction = 0;
				}
				knife.step = 0;
				audio_play_sound_once(snd_projectile);
			}
		}
		
		if(_time > 240 + 70 * _power)
			instance_destroy();
		break;
		
	case 2:	// Перепрыгивание через кости с большим ножом
		_border = battle_border_create(battle_border.up - 40, battle_border.down - 40, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.blue);
		
		if (knife == noone) {
			rand_num = irandom_range(0, 1);
			
			//Добавление ножа
			knife = instance_create_depth(_border.x, _border.y - _border.up - 30, fight_depth.bullet_outside_hight, obj_knife_cross);
			knife.direction = 270;
			knife.image_angle = 270;
			knife.speed_max = 3 + _power * 0.2;
			knife.point_stop_y = _border.y + _border.down - 20;
			audio_play_sound_once(snd_emergence);
		}
		
		if (knife != noone) {
			if (knife.step == 0 && knife.y < _border.y - _border.up - 20)
				knife.x = approach(knife.x, _soul.x, 1);
			if (knife.step == 2) {
				if (knife.y > _border.y + _border.down - 10) {
					knife.point_stop_y = _border.y - _border.up - 20;
					knife.direction = 90;
				}
				else {
					knife.point_stop_y = _border.y + _border.down - 10;
					knife.direction = 270;
					audio_play_sound_once(snd_projectile);
				}
				knife.step = 0;
			}
		}
		
		if(_time == 30) {
			if (knife != noone) {
				knife.is_moving = true;
				audio_play_sound_once(snd_projectile);
			}
		}
		
		if(_time % 80 == 1 and _time < 260 + 60 * _power) {
			var offset = -5;
			var side = -_border.left + offset;
			var bone_dir = 0;
			if (rand_num == 0) {
				offset = 5;
				side = _border.right + offset;
				bone_dir = 180;
			}
			for (var i = 0; i < 5; ++i) {
				create_bone(_border.x + side + offset*i*2, _border.y + _border.down + 4, bone_obj, 2 + 0.2 * _power, 1 + sin(pi*i/4), bone_dir, 0);
			}
		}
		
		if(_time > 300 + 60 * _power)
			instance_destroy();
		break;
}