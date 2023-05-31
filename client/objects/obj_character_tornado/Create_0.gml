event_inherited();
// Base
index = -3; // ЮХУ!!!
name	    = translate_get("Character.Tornado.Name");
description = translate_get("Character.Tornado.Description");
bio			= translate_get("Character.Tornado.Bio");
universe	= "No";
creator	    = "TornadoTech";

// HP
max_hp = 70;
hp = 70;

// Damage
damage = 1;
invulnerability = false;

// Stamina
stamina = 150;
max_stamina = 150;
stamina_regen = 45;
action_stamina_cost = Cost(10, 15, 20);

// Mana
mana = 175;
max_mana = 200;
action_mana_upgrade_cost = Cost(0, 40, 60, 100, 175);
mana_given = 2;
mana_cooldown = 9;

// Soul
soul = spr_tornado_soul;

// Skin
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_tornado_frame;

// Animations
idle_animation = spr_tornado_idle;
after_battle_animation = spr_tornado_idle;
defeated_animation = spr_tornado_dodge;
dodging_animation = spr_tornado_dodge;

// Actions
passive_skill = PassiveSkill("Character.Tornado.PassiveSkill");
actions = [
	Action("Character.Tornado.Attack0", dan_attack_0),
	Action("Character.Tornado.Attack1", dan_attack_1),
	Action("Character.Tornado.Attack2", dan_attack_2)
];
special_action = SpecialAction("Character.Tornado.SpecialAttack", spr_special_attack_tornado, spr_special_attack_tornado_locked, dan_special_attack);

// Soundtrack
soundtrack_name = "The Delta"; 
soundtrack = snd_delta;

dodging = false;
dodging_time = 0;
on_taking_damage = function(damage) {
	if (stamina > 0) {
		fight_remove_player_stamina(player_num, 3 * damage)
		dodging = true;
		dodging_time = 0;
		sprite_index = dodging_animation;
		return 0;
	}
	
	return damage;
}
