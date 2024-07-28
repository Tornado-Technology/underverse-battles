event_inherited();

disable_surface =  true;

damage = get_char_damage(obj_character_ink_sans);


position_target_x = fight_random_integer(obj_battle_border.x - obj_battle_border.left + 10, obj_battle_border.x + obj_battle_border.right - 10); 

destroy = false;

spwan = function () {
	var i = 0;
	var offset = fight_random_integer(5, 10);
	repeat(4) {
		var drop_instance =  create_drop(x - sprite_width + (offset * i), (y - 10) - (1 * i),  obj_drop_black_ink_sans_1, speed_const, i > 2 ? 270 : 170 + (80 * i), true);
		drop_instance.disable_surface = true;
		i++;
	}
	destroy = true;
}
