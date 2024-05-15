event_inherited();

damage = get_char_damage(obj_character_nightmare);
soul_invulnerability = 20;

target_ = false;
speed_coust = 0;
scale_const = 1;
scale_time = 0;

change_scale = function(scale, step) {
	scale_const = scale;
	scale_time = step;
}

on_soul_touch = function(soul) {
	fight_soul_damage(damage, destructible, id);
	soul.tremble_time_max = 600;
	soul_start_tremble(soul);
}

target = function (_target) {
	target_ = true;
	_dir = _target;
};