event_inherited();
index = 4;
name	    = translate_get("Character.SwapSans.Name");
description = translate_get("Character.SwapSans.Description");
bio			= translate_get("Character.SwapSans.Bio");
universe	= "Underswap";
creator		= "AU Community";
#region BASE
max_hp = 120;
hp = 120;
damage = 6;
invulnerability = true;
#endregion
#endregion
#region STAMINA
max_stamina = 120;
stamina = 120;
stamina_regen = 25;
action_stamina_cost = [10, 15, 25];
#endregion
#region MANA
mana = 50;
max_mana = 100;
action_mana_upgrade_cost = [0, 10, 25, 40, 60];
#endregion
#region SOUL
soul = spr_battle_soul;
#endregion
#region SKINS
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_swap_sans_frame;
#endregion
#region ANIMATIONS
idle_animation = spr_swap_sans_idle;
after_battle_animation = spr_swap_sans_idle;
defeated_animation = spr_swap_sans_defeated;
#endregion

passive_skill_name = translate_get("Character.SwapSans.PassiveSkill.Name");
passive_skill_desc = translate_get("Character.SwapSans.PassiveSkill.Description");
actions = [
	Action("Bones",fight_action_type.attack, swap_sans_attack0),
	Action("RotatingBones", fight_action_type.attack, swap_sans_attack1),
	Action("Gasterblasters", fight_action_type.attack, swap_sans_attack2)
];

#region SOUNDTRACK
soundtrack_name = "Bones Shake"; 
soundtrack = snd_bones_shake;
#endregion