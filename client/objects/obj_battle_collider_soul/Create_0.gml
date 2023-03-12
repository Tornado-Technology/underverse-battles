initiative = fight_get_next_initiative();
player = fight_get_player(initiative);
cooldown = 0;
cooldown_max = player.mana_cooldown;
mana_give = player.mana_given;
is_collided = false;
