event_inherited();

alpha = 1;
radius = 10;
alpha_time = 0.05;

disable_surface =  true;

damage = get_char_damage(obj_character_ink_sans);

position_target_x = fight_random_integer(obj_battle_border.x - obj_battle_border.left + 10, obj_battle_border.x + obj_battle_border.right - 10); 

destroying = false;

spwan = function() {
	var i = 0;
	var offset = fight_random_integer(5, 10);
	repeat(4) {
		var drop_instance =  create_drop(x - sprite_width + (offset * i), (y - 10) - (1 * i),  obj_heavy_drop_black_ink_sans, speed_const, i > 2 ? 270 : 170 + (80 * i), true);
		drop_instance.disable_surface = true;
		i++;
	}
	destroying = true;
	
	audio_play_sound_plugging(snd_bomb);
}
