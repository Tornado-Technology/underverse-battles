event_inherited();

damage = get_char_damage(obj_character_nightmare);
soul_invulnerability = 2;

scale_const = 1;
scale_time = 0;
scale_speed = 3;


sprite_set_offset(sprite_index, 30, 9);
on_soul_touch = function(soul) {
	fight_soul_damage(damage, destructible, id);
	soul.tremble_time_max = 600;
	soul_start_tremble(soul);
}
