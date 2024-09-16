event_inherited();
damage = get_char_damage(obj_character_ink_sans);
disable_surface = true;

image_xscale = -1;

is_destroying = false;

angle = dsin(20) * 120;

step = 0.05; 
image_angle = angle + point_direction(x, y, position_x, position_y);
direction = point_direction(x, y, position_x, position_y);
changes_angle = false;

gradually_alpha = true;
image_alpha = 0;
changes  = false;

ink_instance = noone;
spwan_ink = function() {
	ink_instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_track_ink_sans, {
		target_obj: id
	});
	ink_instance.speed_const = speed_const;
}

changes_direction = function() {
	var border_left = obj_battle_border.x - obj_battle_border.left;
	var border_right = obj_battle_border.x + obj_battle_border.right;
	var border_up = obj_battle_border.y - obj_battle_border.up;
	var border_down = obj_battle_border.y + obj_battle_border.down;
	var offset = 30; 
	if (random_type_position == 0) {
		position_x = x > obj_battle_border.x ? border_left : border_right;
		position_y = y > obj_battle_border.y ? border_up : border_down;
	} else {
		position_x = x > obj_battle_border.x ? border_left : border_right;
		position_y = y > obj_battle_border.y ? border_up : border_down;
	}
	changes_angle = true;
}

audio_play_sound_plugging(snd_emergence);