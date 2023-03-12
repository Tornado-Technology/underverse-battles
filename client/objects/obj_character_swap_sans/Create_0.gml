event_inherited();
// Base
index = 4;
name	    = translate_get("Character.SwapSans.Name");
description = translate_get("Character.SwapSans.Description");
bio			= translate_get("Character.SwapSans.Bio");
universe	= "Underswap";
creator		= "AU Community";

// HP
max_hp = 120;
hp = 120;

// Damage
damage = 6;
invulnerability = true;

// Stamina
max_stamina = 120;
stamina = 120;
stamina_regen = 25;
action_stamina_cost = [10, 15, 25];

// Mana
mana = 50;
max_mana = 100;
action_mana_upgrade_cost = [0, 10, 25, 40, 60];

// Soul
soul = spr_battle_soul;

// Skin
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_swap_sans_frame;

// Animations
idle_animation = spr_swap_sans_idle;
after_battle_animation = spr_swap_sans_idle;
defeated_animation = spr_swap_sans_defeated;

// Actions
passive_skill = PassiveSkill("Character.SwapSans.PassiveSkill");
actions = [
	Action("Character.SwapSans.Attack0", swap_sans_attack0),
	Action("Character.SwapSans.Attack1", swap_sans_attack1),
	Action("Character.SwapSans.Attack2", swap_sans_attack2)
];
special_action = SpecialAction("Character.SwapSans.SpecialAttack", spr_special_attack_swap_sans, swap_sans_special_attack);

// Special
damage_per_hit = 0;
max_damage_per_hit = 8;

// Methods
on_taking_soul_damage = function(soul, damage) {
	if (damage_per_hit < max_damage_per_hit)
		damage_per_hit += damage;
	if (damage_per_hit == max_damage_per_hit) {
		soul.invincibility = 20;
	}
	alarm[0] = 2;
		
	return damage;
};

// Soundtrack
soundtrack_name = "Bones Shake"; 
soundtrack = snd_bones_shake;
#endregion