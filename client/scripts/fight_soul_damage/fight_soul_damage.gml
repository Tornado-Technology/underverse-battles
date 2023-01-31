/// @param {Real} damage
/// @param {Bool} destroy
/// @param {Id.Intance} instance
function fight_soul_damage(_damage, _destroy = false, _inst) {
	var soul = obj_battle_soul;
	var enemy_id = fight_get_next_initiative();
	
	// Some checks
	if (!instance_exists(obj_battle)) return;
	if (!instance_exists(soul)) return;
	
	// Lmao
	if (soul.invincibility > 0) return;
	
	// Character passive skill
	_damage = fight_get_enemy(enemy_id).on_taking_damage(_damage);
	
	// Really damage!
	fight_enemy_hurt(enemy_id, _damage);
	
	// Add to statistic
	if (_damage > 0) {
		battle_add_damage(_damage);
		fight_draw_damage_number(enemy_id, _damage);
		audio_play_sound_plugging(snd_soul_damage);
	}
	
	// Set invulnerability
	if (_inst != noone)
		battle_set_soul_invulnerability(_inst.soul_invulnerability);

	if (_destroy && _inst != noone) {
		instance_destroy(_inst);
	}
}