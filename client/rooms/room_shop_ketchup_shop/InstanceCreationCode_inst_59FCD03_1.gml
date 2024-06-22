// NPC
npc = obj_dino_seller;

heal_more_for_character = function(character, hp) {
	var current_character = obj_inventory.character;
	
	if (current_character == character) {
		current_character.heal(hp);
	}
}

use_with_sans = function() {
	if (variable_instance_get(gameplay_underverse_episode_3_surface, "ketchup_joke_was_told")) return;
	if (!instance_exists(obj_character_sans)) return;
	if (!obj_character_sans.is_following) return;
	
	variable_instance_set(gameplay_underverse_episode_3_surface, "ketchup_joke_was_told", true);
	
	var current_character = obj_inventory.character;
	cutscene_create([
		[cutscene_execute, current_character.set_uncontrolled],
		[cutscene_wait, 0.6],
		[cutscene_dialog, "Underverse_Episode3.FriskDrankKetchup", dir.up],
		[cutscene_execute, current_character.set_controlled]
	]);
}

// Items
items = [
	new Heal("Ketchup", 10, 12, function() {heal_more_for_character(obj_character_sans, 20); use_with_sans(); }),
	new Heal("Mustard", 10, 12, function() {heal_more_for_character(obj_character_fell_sans, 20); }),
	new Heal("CheeseSauce", 10, 12),
	new Heal("KetchupLimited", 12, 20, function() {heal_more_for_character(obj_character_sans, 50); use_with_sans(); }),
];
item_button_count = array_length(items);

// Talk
talks = [
	{name: translate_get("Shop.Dino.TalkButton.AboutName"), monolog:  translate_get("Shop.Dino.AboutName"), cost: 0},
	{name: translate_get("Shop.Dino.TalkButton.AboutShop"), monolog:  translate_get("Shop.Dino.AboutShop"), cost: 0},
	{name: translate_get("Shop.Dino.TalkButton.AboutMonsters"), monolog:  translate_get("Shop.Dino.AboutMonsters"), cost: 0}
];
talk_button_count = array_length(talks);

// Monolog
main_dialog = translate_get("Shop.Dino.Main");
greeting_dialog = translate_get("Shop.Dino.Greeting");
item_dialog = translate_get("Shop.Dino.Buy");
sell_dialog = translate_get("Shop.Dino.Sell");
talk_dialog = translate_get("Shop.Dino.Talk");
farewell_dialog = translate_get("Shop.Dino.Farewell");
gratitude_dialog = translate_get("Shop.Dino.Gratitude");

ui = new UIShop(main_dialog, greeting_dialog, item_dialog, sell_dialog, talk_dialog, farewell_dialog, gratitude_dialog, menu_button_text, items, talks);

// Transition
previous_room = room_underverse_episode_3_ketchup_shop;