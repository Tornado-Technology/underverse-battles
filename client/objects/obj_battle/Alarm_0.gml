var enemy_id = fight_get_initiative();
var attack_id = fight_get_enemy_action(enemy_id);
var attack_power = fight_get_enemy_power(enemy_id);

fight_get_enemy(1 - enemy_id).on_selected_attack(attack_id, enemy_id);

fight_call_attack(enemy_id, attack_id, attack_power);
