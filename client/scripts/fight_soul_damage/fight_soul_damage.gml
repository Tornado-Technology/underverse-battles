/// @param {Real} damage
/// @param {Bool} destroy
/// @param {Id.Intance} instance
function fight_soul_damage(_damage, _destroy = false, _inst) {
	var soul = obj_battle_soul;
	var player_id = fight_get_next_initiative();
	
	// Some checks
	if (!instance_exists(obj_battle)) return;
	
	// Lmao
	if (soul.invincibility > 0) return;
	
	// Player's method
	fight_get_player(player_id).on_taking_soul_damage(soul, _damage);
	
	// Really damage!
	fight_player_hurt(player_id, _damage);
	
	// Add to statistic
	if (_damage > 0) {
		battle_add_damage(_damage);
		fight_draw_damage_number(player_id, _damage);
		audio_play_sound_plugging(snd_soul_damage);
	}
	
	// Set invulnerability
	if (_inst != noone)
		soul.invincibility = _inst.soul_invulnerability;

	if (_destroy && _inst != noone) {
		instance_destroy(_inst);
	}
}