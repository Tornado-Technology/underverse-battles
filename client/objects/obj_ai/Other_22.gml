///@desc mana
var mana = fight_get_player_mana(1);
var max_mana = fight_get_player_max_mana(1);
var mana_given = fight_get_player(1).mana_given;
var pow = fight_get_player_power(0);

var colliding_number = 0;

if (pow == 0)
	colliding_number = irandom_range(1, 8)*mana_given;
else if (pow == 1)
	colliding_number = irandom_range(1, 9)*mana_given;
else if (pow == 2)
	colliding_number = irandom_range(2, 9)*mana_given;
else if (pow == 3)
	colliding_number = irandom_range(2, 10)*mana_given;
else if (pow == 4)
	colliding_number = irandom_range(3, 10)*mana_given;
	
fight_add_player_mana(1, _hits + colliding_number);