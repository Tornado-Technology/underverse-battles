event_inherited();

var current_player = fight_get_player(fight_get_iniciative());
damage = get_char_damage(current_player);
soul_invulnerability = get_char_invulnerability(current_player) ? 20 : 1;