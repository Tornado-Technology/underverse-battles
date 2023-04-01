/// @desc Big Knife
if (started) exit;

switch (attack_num) {
	case 0:	// Нож режет арену и кости вылетают справа и слева
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.red);
		
		update_0_0(_power);
		time_source_start(time_source_update_1_0);
		time_source_start(time_source_update_1_0_2);
		time_source_start(time_source_update_destroy_1_0);
		break;
	
	case 1:	// Нож летает справа-слева
		_border = battle_border_create(battle_border.up - 45, battle_border.down - 45, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.red);
		
		var _sign = choose(-1, 1);
		knife = instance_create_depth(_border.x - _border.left - 30, _border.y, fight_depth.bullet_outside_hight, obj_knife_cross);
		speed_angle = _sign * (4 + _power * 0.2);
		direction = 0;
		point_stop_x = _border.x + _border.right + 20;
		audio_play_sound_once(snd_emergence);
			
		time_source_start(time_source_update_1_1);
		time_source_start(time_source_update_destroy_1_1);
		break;
		
	case 2:	// Перепрыгивание через кости с большим ножом
		_border = battle_border_create(battle_border.up - 40, battle_border.down - 40, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.blue);
		
		rand_num = irandom_range(0, 1);
		
		knife = instance_create_depth(_border.x, _border.y - _border.up - 30, fight_depth.bullet_outside_hight, obj_knife_cross);
		direction = 270;
		image_angle = 270;
		point_stop_y = _border.y + _border.down - 20;
		audio_play_sound_once(snd_emergence);
		
		time_source_start(time_source_update_1_2);
		time_source_start(time_source_update_1_2_2);
		time_source_start(time_source_update_destroy_1_2);
		break;
}

started = true;