// NPC
npc = obj_muffet_seller;

// Items
items = [
	new Heal(translate_get("Item.SpiderDonut.Name"), translate_get("Item.SpiderDonut.Description"), 18, 9),
	new Heal(translate_get("Item.SpiderCider.Name"), translate_get("Item.SpiderCider.Description"), 24, 12),
	new Heal(translate_get("Item.MuffetMuffin.Name"), translate_get("Item.MuffetMuffin.Description"), 30, 14)
];
item_button_count = array_length(items);

// Talk
talks = [
	{name: translate_get("Shop.Muffet.TalkButton.AboutBakery"), monolog:  translate_get("Shop.Muffet.AboutBakery"), cost: 0},
	{name: translate_get("Shop.Muffet.TalkButton.AboutMuffin"), monolog:  translate_get("Shop.Muffet.AboutMuffin"), cost: 0},
	{name: translate_get("Shop.Muffet.TalkButton.AboutPet"), monolog:  translate_get("Shop.Muffet.AboutPet"), cost: 0}
];
talk_button_count = array_length(talks);

// Monolog
main_dialog = translate_get("Shop.Muffet.Main");
greeting_dialog = translate_get("Shop.Muffet.Greeting");
item_dialog = translate_get("Shop.Muffet.Buy");
sell_dialog = translate_get("Shop.Muffet.Sell");
talk_dialog = translate_get("Shop.Muffet.Talk");
farewell_dialog = translate_get("Shop.Muffet.Farewell");
gratitude_dialog = translate_get("Shop.Muffet.Gratitude");

ui = new UIShop(main_dialog, greeting_dialog, item_dialog, sell_dialog, talk_dialog, farewell_dialog, gratitude_dialog, menu_button_text, items, talks);

// Transition
previous_room = room_underverse_episode_3_muffet_bakery;