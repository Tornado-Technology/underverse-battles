initiative = fight_get_next_initiative();
enemy = fight_get_enemy(initiative);
cooldown = 0;
cooldown_max = enemy.mana_cooldown;
mana_give = enemy.mana_given;
is_collided = false;
