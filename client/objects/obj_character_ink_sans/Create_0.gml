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
action_stamina_cost = Cost(10, 15, 20);

// Mana
mana	 = 50;
max_mana = 100;
action_mana_upgrade_cost =  Cost(0, 10, 25, 40, 60);

// Soul
soul = spr_soul_empty;

// Skin
skin_name = translate_get("CharactersStyles.Classic");
frame = spr_ink_sans_frame;

// Animations
idle_animation = spr_char_ink_sans_idle;
after_battle_animation = spr_char_ink_sans_idle;
defeated_animation = spr_char_ink_sans_defeated;

// Actions
passive_skill = PassiveSkill("Character.InkSans.PassiveSkill");
actions = [
	Action("Character.InkSans.Attack0", ink_sans_attack0),
	Action("Character.InkSans.Attack1", ink_sans_attack1),
	Action("Character.InkSans.Attack2", ink_sans_attack2)
];
special_action = SpecialAction("Character.InkSans.SpecialAttack", spr_special_attack_ink_sans, spr_special_attack_ink_sans_locked, ink_sans_special_attack);

// Special
on_selected_attack = function(attack_id, player_id) {
	var player = fight_get_player(player_id);
	player.use_gravity_attack = false;
}

// Soundtrack
soundtrack_name = "Brushwork"; 
soundtrack = snd_brushwork;
