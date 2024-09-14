initiative = fight_get_next_initiative();
player = fight_get_player(initiative);
mana_give = player.mana_given;

cooldown = 0;
cooldown_max = player.mana_cooldown;

instance = noone;
is_collided = false;