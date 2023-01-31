///@desc mana
var mana = fight_get_enemy_mana(1);
var max_mana = fight_get_enemy_max_mana(1);
var mana_given = fight_get_enemy(1).mana_given;
var pow = fight_get_enemy_power(0);

if (pow == 0)
	collider_soul = irandom_range(1, 8)*mana_given;
else if (pow == 1)
	collider_soul = irandom_range(1, 9)*mana_given;
else if (pow == 2)
	collider_soul = irandom_range(2, 9)*mana_given;
else if (pow == 3)
	collider_soul = irandom_range(2, 10)*mana_given;
else if (pow == 4)
	collider_soul = irandom_range(3, 10)*mana_given;
	
fight_add_enemy_mana(1, _hits + collider_soul);