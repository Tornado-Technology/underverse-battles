event_inherited();
// Base
index = character_id.swap_papyrus;
name	    = translate_get("Character.SwapPapyrus.Name");
description = translate_get("Character.SwapPapyrus.Description");
bio			= translate_get("Character.SwapPapyrus.Bio");
universe	= "Underswap";
creator		= "AU Community";

// HP
max_hp = 100;
hp = 100;

// Damage
damage = 1;
invulnerability = false;

// Stamina
max_stamina = 100;
stamina = 100;
stamina_regen = 20;
action_stamina_cost = Cost(10, 15, 20);

// Mana
mana = 50;
max_mana = 100;
action_mana_upgrade_cost = Cost(0, 10, 25, 40, 60);

//Soul
soul = spr_battle_soul;

// Skin
skin_name = translate_get("CharactersStyles.Classic");
frame = spr_swap_papyrus_frame;

// Animation
idle_animation = spr_swap_papyrus_idle;
after_battle_animation = spr_swap_papyrus_smoking;
defeated_animation = spr_swap_papyrus_defeated;

// Actions
passive_skill = PassiveSkill("Character.SwapPapyrus.PassiveSkill");
actions = [
	Action("Character.SwapPapyrus.Attack0", swap_papyrus_attack0),
	Action("Character.SwapPapyrus.Attack1", swap_papyrus_attack1),
	Action("Character.SwapPapyrus.Attack2", swap_papyrus_attack2)
];
special_action = SpecialAction("Character.SwapPapyrus.SpecialAttack", spr_special_attack_sans, spr_special_attack_sans_locked, swap_papyrus_special_attack);

// Special
use_gravity_attack = true;

on_skipping = function(player_id) {
	fight_add_player_mana(player_id, 10);
	if (fight_network_mode) send_fight_mana(added_mana);
}

// Soundtrack
soundtrack_name = "Disappointment"; 
soundtrack = snd_disappointment;