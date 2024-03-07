event_inherited();

//Skin
skin_name = translate_get("CharactersStyles.VoodooDoll");

frame = spr_swap_sans_voodoo_doll_frame;

// Animations
idle_animation = spr_swap_sans_idle_voodoo_doll;
after_battle_animation = spr_swap_sans_idle_voodoo_doll;
defeated_animation = spr_swap_sans_defeated_voodoo_doll;
fight_0_start_animation = spr_swap_sans_attack_0_start_voodoo_doll;
fight_0_idle_animation = spr_swap_sans_attack_0_idle_voodoo_doll;
fight_0_finish_animation = spr_swap_sans_attack_0_finish_voodoo_doll;

defeated_animation_last_image = spr_swap_sans_defeated_last_image_voodoo_doll;

// Heads
head_x_offset = 18;
head_x_offset_max = 18;
head_y_offset = 30;
head_y_offset_max = 30;

head_ink_sprite = spr_voodoo_head_ink;
head_error_sprite = spr_voodoo_head_error;
head_sans_sprite = spr_voodoo_head_sans;
head_fell_sans_sprite = spr_voodoo_head_fell_sans;
head_swap_sans_sprite = spr_voodoo_head_swap_sans;
head_swap_papyrus_sprite = spr_voodoo_head_swap_papyrus;
head_cross_sprite = spr_voodoo_head_cross;
head_xchara_sprite = spr_voodoo_head_xchara;
head_green_sprite = spr_voodoo_head_green;

head_sprites = [head_ink_sprite, head_error_sprite, head_sans_sprite, head_fell_sans_sprite, head_swap_sans_sprite, head_swap_papyrus_sprite, head_xchara_sprite, head_cross_sprite, head_green_sprite];
current_head_sprite = spr_empty;

// Method

add_head = function() {
	if (global.fight_instance == noone || player_num == -1) exit;
	var character_index = global.fight_instance.player[1 - player_num].index;
	if (character_index < 0 && character_index >= array_length(head_sprites)) exit;
	current_head_sprite = head_sprites[character_index];
	head_x_offset = player_num == 0 ? head_x_offset_max : -head_x_offset_max;
	image_xscale = player_num == 0 ? 1 : -1;
}

// Time source
time_source_head = time_source_create(time_source_game, 1, time_source_units_seconds, function () {
	if (head_y_offset == head_y_offset_max) {
		head_y_offset++;
		return;
	}
	head_y_offset--;
}, [], -1);
time_source_start(time_source_head);