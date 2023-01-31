/// @desc Attack 0
_time++;

border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
if (battle_border_start_animation_end()) exit;
soul = create_soul(border.x, border.y, battle_soul_type.red);

if (_time % 24 == 0) {
	var random_position = Vector2(0, -10);
	if (irandom_range(0, 1) == 0) {
		// Right
		var offset_x = 25;
		var start_x = border.x - border.right - 10;
		random_position.x = start_x - irandom_range(offset_x, offset_x * 2);
	} else {
		// Left
		var offset_x = 25;
		var start_x = border.x + border.left + 10;
		random_position.x = start_x + irandom_range(offset_x, offset_x * 2);
	} 
	
	var box = instance_create_depth(random_position.x, random_position.y, 0, obj_jevil_box);
	box.sprite_index = choose(spr_jevil_hearts_box, spr_jevil_clubs_box, spr_jevil_diamonds_box, spr_jevil_spades_box);
	box.target_position.x = box.x;
	box.target_position.y = border.y + border.down + irandom_range(-125, 50);
	box._speed.x = 1;
	box._speed.y = random_range(2, 2.7);
}

if (_time > 420) instance_destroy();