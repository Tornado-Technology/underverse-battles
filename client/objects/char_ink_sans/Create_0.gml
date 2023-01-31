event_inherited();
// Base
index = 0;
name	    = translate_get("Character.InkSans.Name");
description = translate_get("Character.InkSans.Description");
bio			= translate_get("Character.InkSans.Bio");
universe	= "Outer code";
creator		= "Myebi";

// HP
max_hp = 100;
hp	   = 100;

// Damage
damage = 1;
invulnerability = false;

//Stamina
max_stamina = 100;
stamina		= 100;
stamina_regen = 20;
action_stamina_cost = [10, 15, 20];

// Mana
mana	 = 50;
max_mana = 100;
action_mana_upgrade_cost = [0, 10, 25, 40, 60];

// Soul
soul = spr_battle_soul_empty;

// Skin
skin_name = translate_get("CharactersStyles.Classic");
frame = spr_ink_sans_frame;

// Animations
idle_animation = spr_char_ink_sans_idle;
after_battle_animation = spr_char_ink_sans_idle;
defeated_animation = spr_char_ink_sans_defeated;
#endregion

// Attacls
passive_skill_name = translate_get("Character.InkSans.PassiveSkill.Name");
passive_skill_desc = translate_get("Character.InkSans.PassiveSkill.Description");
actions = [
	Action("Inks", fight_action_type.attack, ink_sans_attack0),
	Action("Broomie", fight_action_type.attack, ink_sans_attack1),
	Action("InkGasterblasters", fight_action_type.attack, ink_sans_attack2)
];

// Special
on_selected_attack = function(attack_id, enemy_id) {
	var enemy = fight_get_enemy(enemy_id);
	if (enemy.has_gravity_change && enemy.gravity_attack_num == attack_id) {
		enemy.use_gravity_attack = false;
	}
}

// Soundtrack
soundtrack_name = "Brushwork"; 
soundtrack = snd_brushwork;
