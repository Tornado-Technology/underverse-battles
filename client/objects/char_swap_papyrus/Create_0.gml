event_inherited();
index = 5;
name	    = translate_get("Character.SwapPapyrus.Name");
description = translate_get("Character.SwapPapyrus.Description");
bio			= translate_get("Character.SwapPapyrus.Bio");
universe	= "Underswap";
creator		= "AU Community";
#region BASE
max_hp = 100;
hp = 100;
damage = 1;
invulnerability = false;
#endregion
#region STAMINA
max_stamina = 100;
stamina = 100;
stamina_regen = 20;
action_stamina_cost = [10, 15, 20];
#endregion
#region MANA
mana = 50;
max_mana = 100;
action_mana_upgrade_cost = [0, 10, 25, 40, 60];
#endregion
#region SOUL
soul = spr_battle_soul;
#endregion
#region SKIN
skin_name = translate_get("CharactersStyles.Classic");
frame = spr_swap_papyrus_frame;
#endregion
#region ANIMATIONS
idle_animation = spr_swap_papyrus_idle;
after_battle_animation = spr_swap_papyrus_smoking;
defeated_animation = spr_swap_papyrus_defeated;
#endregion

passive_skill_name = translate_get("Character.SwapPapyrus.PassiveSkill.Name");
passive_skill_desc = translate_get("Character.SwapPapyrus.PassiveSkill.Description");
actions = [
	Action("Bones",fight_action_type.attack, swap_papyrus_attack0),
	Action("Gasterblasters", fight_action_type.attack, swap_papyrus_attack1),
	Action("OrangeAttack", fight_action_type.attack, swap_papyrus_attack2)
];

// Special
has_gravity_change = true;
gravity_attack_num = 2;
use_gravity_attack = true;

on_skipping = function(enemy_id) {
	fight_add_enemy_mana(enemy_id, 10);
}

#region SOUNDTRACK
soundtrack_name = "Disappointment"; 
soundtrack = snd_disappointment;
#endregion