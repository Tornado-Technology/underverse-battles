draw_sprite_stretched(spr_fight_ui_action_box, 0, action_box_position.x, action_box_position.y, action_box_size.x, action_box_size.y);

draw_set_font(font_determination);
draw_set_halign(fa_left);

for (var i = 0; i < 3; i++) {
	var action = "NameAttack";
	var offset_postion = Vector2(0, i * 18);
	var text_position = Vector2(5,  2).add(offset_postion).add(action_box_position);
	var soul_position = Vector2(9, 10).add(offset_postion).add(action_box_position);
		
	draw_text_color(text_position.x, text_position.y, action, c_white, c_white, c_white, c_white, 1);
		
	delete text_position;
	delete soul_position;
	delete offset_postion;
}

draw_reset();
