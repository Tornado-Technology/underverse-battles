position_x_start = -100;
position_x_finish = 20;
position_x = position_x_start;
position_y = 40;
text_padding = 20;

character = obj_character_frisk;
money = 50;

max_item_count = 8;
sprite_index = spr_empty;

is_open = false;

items = [
	new Item(translate_get("Item.HeartShaped.Name"), translate_get("Item.HeartShaped.Description"))
		.set_can_destroy_by_use(false),
];

ui = new UIInventory(character, items, max_item_count);

open = function() {
	is_open = true;
	ui.init();
	character.set_uncontrolled();
	audio_play_sound_plugging(snd_selection);
}

close = function() {
	is_open = false;
	character.set_controlled();
	audio_play_sound_plugging(snd_selection);
}

add_item = function(item) {
	ui.add_item(item);
}

delete_item = function(item) {
	array_delete(items, array_find_index(items, function(value) {
		return value.name == item.name
	}), 1);
}

ui.set_back_function(close);