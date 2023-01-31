/// @param structure
function CharacterConstructor(struct = {}) constructor {
	name        = "Turtle";
	description = "Turtles are cool";
	bio         = "Turtles (lat. Testudines) are one of the four modern orders of reptiles.";
	universe    = "Turtles World";
	creator     = "Turtle!";
	version		= "1.3.0";
	
	// Base
	max_hp = 100;
	hp     = 100;
	damage = 1;
	invulnerability = false;
	
	// Stamina
	max_stamina = 100;
	stamina     = 100;
	stamina_regen = 20;
	action_stamina_cost = Cost(10, 50, 100);
	
	// Mana
	max_mana = 100;
	mana     = 50;
	action_mana_upgrade_cost = Cost(0, 10, 25, 40, 60);
	
	// Skin
	skin = new Skin("Skin", spr_battle_soul, spr_char_sans_idle, spr_sans_frame, snd_megalorchestra, "Megaloorchestra");
	
	// Actions or attacks
	// action[0] = new Action("Atk 1", "Atk 1 so hard", char_sans_attack_0, fight_action_type.attack);
	// action[1] = new Action("Atk 2", "Atk 2 so hard", char_sans_attack_1, fight_action_type.attack);
	// action[2] = new Action("Atk 3", "Atk 3 so hard", char_sans_attack_2, fight_action_type.attack); 
}


/// @param name
/// @param soul
/// @param sprtie
/// @param frame
/// @param sound
/// @param sound_name
/// @param skins
function Skin(_name, _soul, _image, _frame, _sound = snd_megalorchestra, _sound_name = "Megaloorchestra", _skins = []) constructor {
	name = _name
	soul = _soul;
	image = _image;
	frame = _frame;
	skins = _skins;
	soundtrack = _sound;
	soundtrack_name = _sound_name;
}
