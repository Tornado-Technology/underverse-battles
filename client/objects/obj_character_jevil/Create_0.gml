event_inherited();
// Base
index = character_id.jevil;
name	    = translate_get("Character.Jevil.Name");
description = translate_get("Character.Jevil.Description");
bio			= translate_get("Character.Jevil.Bio");
universe	= "Deltarune";
creator		= "Toby Fox";

// HP
max_hp = 100;
hp = max_hp;

// Damage
damage = 5;
invulnerability = true;

// Stamina
max_stamina = 100;
stamina = 100;
stamina_regen = 30;
action_stamina_cost = [10, 15, 20];

// Mana
mana = 50;
max_mana = 100;
action_mana_upgrade_cost = [0, 10, 25, 40, 60];


// Snd
snd_beginning_attack = [snd_jevil_chaos, snd_jevil_anything];


// Soul
soul = spr_battle_soul;

// Skin
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_jevil_frame;

// Animations
idle_animation = spr_jevil_idle;
after_battle_animation = spr_jevil_after_battle;
defeated_animation =  spr_jevil_defeated;


fight_2_start_animation = spr_jevil_scythe_start;
fight_2_idle_animation = spr_jevil_scythe_idle;
fight_2_finish_animation = spr_jevil_scythe_finish;


// Actions
passive_skill = PassiveSkill("Character.Jevil.PassiveSkill");
actions = [
	Action("Character.Jevil.Attack0", jevil_attack0),
	Action("Character.Jevil.Attack1", jevil_attack1),
	Action("Character.Jevil.Attack2", jevil_attack2)
];

special_action = SpecialAction("Character.Jevil.SpecialAttack", spr_special_attack_jevil, spr_special_attack_jevil_locked, jevil_special_attack);


on_battle_end = function(damage) {
	if (hp <= 40) {
		var _player_id = fight_get_initiative();
		var added_mana = irandom_range(1, 8);
			fight_add_player_mana(_player_id, added_mana);
		if (fight_network_mode) send_fight_mana(added_mana);
	};

	return damage;
}

play_snd_being_attack = function () {
	var i = irandom(array_length(snd_beginning_attack) - 1);
	
	return audio_play_sound_plugging(snd_beginning_attack[i]);
}



// Soundtrack
soundtrack_name = "THE WORLD \n         REVOLVING"; 
soundtrack =  snd_the_world_revolving;