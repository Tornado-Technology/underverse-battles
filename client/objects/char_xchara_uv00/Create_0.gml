event_inherited();
index = 7;
name	    = translate_get("Character.XtaleChara.Name");
description = translate_get("Character.XtaleChara.Description");
bio			= translate_get("Character.XtaleChara.Bio");
universe	= "XTale";
creator		= "Jakei";
#region BASE
max_hp = 60;
hp = 60;
damage = 5;
invulnerability = true;
#endregion
#region STAMINA
max_stamina = 100;
stamina = 100;
stamina_regen = 15;
action_stamina_cost = [5, 10, 50];
#endregion
#region MANA
mana = 50;
max_mana = 100;
action_mana_upgrade_cost = [0, 10, 25, 40, 60];
#endregion
#region SOUL
soul = spr_battle_soul_red;
#endregion
#region SKIN
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_xchara_frame;
#endregion
#region ANIMATIONS
idle_animation = spr_xchara_idle;
after_battle_animation = spr_xchara_idle;
defeated_animation = spr_xchara_defeated;
#endregion

passive_skill_name = translate_get("Character.XtaleChara.PassiveSkill.Name");
passive_skill_desc = translate_get("Character.XtaleChara.PassiveSkill.Description");
actions = [
	Action("Knives", fight_action_type.attack, xchara_attack0),
	Action("DamageWave", fight_action_type.attack, xchara_attack1),
	Action("Save", fight_action_type.healing, xchara_attack2)
];
#region SOUNDTRACK
soundtrack_name = "Overwrite"; 
soundtrack = snd_overwrite;
#endregion