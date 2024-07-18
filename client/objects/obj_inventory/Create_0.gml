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
can_closing = true;

searching_name = "";

items = [
	new Item("HeartShaped")
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
		return value.name == item.name;
	}), 1);
}

remove_money = function(cost) {
	if (money < cost) return false;
	money -= cost;
	return true;
}

has = function(name) {
	searching_name = name;
	return array_any(ui.items, function(item) {
		return item.key == searching_name;
	});
}

check_used = function(name) {
	searching_name = name;
	return ui.using_item.key == searching_name;
}

set_cutscene_inventory = function(callback) {
	if (value) {
		can_closing = false;
		ui.is_draw_back_button = false;
		ui.is_selection_for_story = true;
		ui.selection_callback = callback;
		open();
	}
}

set_default_inventory = function() {
	can_closing = true;
	ui.is_draw_back_button = true;
	ui.is_selection_for_story = false;
	close();
}

ui.set_back_function(close);