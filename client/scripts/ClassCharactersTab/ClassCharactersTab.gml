// Abstract
function ClassCharactersTab(menu_instance) constructor {
	self.menu_instance = menu_instance;
	self.characters = [];
	character_frames = [];
	is_show_selection = true;
	selected_character = 0;
	count_cell_horizontal = 0;
	count_cell_vertical = 0;
	
	static get_frame = function(_id) {
		return character_frames[_id];
	}
	
	static on_click_on_character = function(_id) {
		audio_play_sound_plugging(snd_selection);
	}
	
	static on_hover_on_character = function(_id) {
		character_frames[selected_character].unfocus();
		selected_character = _id;
		menu_instance.character = characters[_id];
		audio_play_sound_plugging(snd_click);
	}
	
	static change_selected_character = function(_id, is_play_sound = true) {
		if (_id < 0 || _id >= array_length(character_frames)) return;
		
		character_frames[selected_character].unfocus();
		selected_character = _id;
		menu_instance.character = characters[_id];
		character_frames[selected_character].focus();
		if (is_play_sound) audio_play_sound_plugging(snd_click);
	}
	
	static hide_selection = function() {
		is_show_selection = false;
	}
	
	static show_selection = function() {
		is_show_selection = true;
	}
	
	static activate_button = function() {
		character_frames[selected_character].press();
	}
	
	static on_draw_cell = function(array_x, array_y) {
		var character_id = array_x + count_cell_horizontal * array_y;
		
		var rectangle_x = menu_instance.rec_x1;
		var rectangle_y = menu_instance.rec_y1;
		var frame_width = menu_instance.frame_width;
		var frame_height = menu_instance.frame_height;
		var offset_x = menu_instance.dist_x;
		var offset_y = menu_instance.dist_y;
		var top_shift = menu_instance.top_shift;
		var sprite_target = menu_instance.sprite_target;
		var image_target_num = menu_instance.imange_target_num;
		
		var position_x = rectangle_x + frame_width * array_x + offset_x * (array_x + 1);
		var position_y = rectangle_y + frame_height * array_y + offset_x + offset_y * array_y + top_shift;
		
		
		character_frames[character_id].draw(position_x, position_y);
		
		if (selected_character != character_id) return;
		if (!is_show_selection) return;
		
		draw_sprite(sprite_target, image_target_num, position_x, position_y);
	}
	
	static init = function() {
		// Clear old frame
		array_clear(character_frames);
		
		for (var i = 0; i < array_length(characters); i++) {
			character_frames[i] = UIImageButton(characters[i].frame);
			character_frames[i]._id = i;
			character_frames[i].is_auto_focus = false;
			character_frames[i].is_animation_hover = true;
			character_frames[i].callback = function(button) {
				on_click_on_character(button._id);
			}
			
			character_frames[i].on_hover = function(button) {
				on_hover_on_character(button._id);
			}
		}
		
		if (array_length(character_frames) > 0) {
			character_frames[0].focus();
		}
	}
	
	static update = function() {
		if (menu_instance.input_horizontal != 0) {
			change_selected_character(selected_character + menu_instance.input_horizontal);
		}
		if (menu_instance.input_vertical != 0) {
			change_selected_character(selected_character + count_cell_horizontal * menu_instance.input_vertical);
		}
		
		if (menu_instance.input_enter) {
			activate_button();
		}
	}
	
	static draw = function() {
		var count = array_length(character_frames);
		
		for (var i = 0; i < count_cell_vertical; i++) {
			for (var j = 0; j < count_cell_horizontal; j++) {
				if (count <= 0) break;
				
				on_draw_cell(j, i);
				count--;
			}
		}
	}
}