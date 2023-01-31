/// @desc Attack - Tea

// Heal
if (!use_heal) {
	var heal = (_power + 1) * 2;
	fight_enemy_heal(character_initiative, heal);
	audio_play_sound_plugging(snd_healing);
	use_heal = true;
}

if (!fight_network_mode && character_initiative == 0) {
	instance_destroy();
	exit;
}

switch (number) {
	case 0:
		// Create border
		border_instance = battle_border_create(8, 64, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;

		// Create soul
		soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);

		if (instance_cup == noone) {
			instance_cup = instance_create_depth(border_instance.x, border_instance.y - border_instance.up - 32, 0, obj_cup_delta, {
				pow: _power + 2,
				floor_y: border_instance.y - border_instance.up,
				target_speed_max: 2,
				target_speed: 2,
				target_angle: 45,
				target_left: border_instance.x - border_instance.right + 20,
				target_right: border_instance.x + border_instance.left + 20,
				target_direction: dir.left
			});
		}

		if (time > 320 + 20 * _power) instance_destroy();
		break;
		
	case -1:
		// Create border
		border_instance = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;

		// Create soul
		soul_instance = create_soul(border_instance.x, border_instance.y - border_instance.up + 16, battle_soul_type.blue);

		if (instance_tea == noone) {
			instance_tea = instance_create_depth(border_instance.x, border_instance.y + border_instance.down, 0, obj_tea_delta, {
				image_xscale: round((border_instance.left + border_instance.right) / 32)
			});
		}
		
		if (time % 30 == 0 || time == 0) {
			 var inst = noone;
			 inst = instance_create_depth(border_instance.x - border_instance.left / 2 - 25, border_instance.y - border_instance.up,  fight_depth.bullet_outside_hight, obj_platform);
			 inst.image_xscale = 6;
			 inst._angle = dir.down;
			 inst._speed = 1;
			 
			 inst = instance_create_depth(border_instance.x + border_instance.right / 2, border_instance.y - border_instance.up, fight_depth.bullet_outside_hight, obj_platform);
			 inst.image_xscale = 6;
			 inst._angle = dir.down;
			 inst._speed = 1;
		}

		if (time > 320 + 20 * _power) instance_destroy();
		break;
		
	case 1:
		// Create border
		border_instance = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;

		// Create soul
		soul_instance = create_soul(border_instance.x, border_instance.y - 30, battle_soul_type.yellow);
		soul_instance.image_angle += 1;

		if (instance_tea == noone) {
			instance_tea = instance_create_depth(border_instance.x, border_instance.y + border_instance.down, 0, obj_tea_delta, {
				image_xscale: round((border_instance.left + border_instance.right) / 32)
			});

		}
		
		if (time % 60 == 0 || time == 0) {
			 var inst = instance_create_depth(border_instance.x - border_instance.right, border_instance.y + border_instance.down - 25, fight_depth.bullet_outside_hight, obj_platform);
			 inst.image_angle = 0;
			 inst.image_xscale = 5;
			 inst._angle = dir.right;
			 inst._speed = 1 + 0.8 / _power;
		}
		
		if (time % 120 == 0) {
			var new_direction = dir.down;
			
			soul_instance.gravity_force = new_direction;
			soul_instance.max_fly_time = 60;
			soul_instance.fly_time = soul_instance.max_fly_time;
			soul_instance.blue_attack = true;
			soul_instance.addit_spd = 1 + 0.8 / _power;
		}
		
		if (time > 320 + 20 * _power) instance_destroy();
		break;
}
