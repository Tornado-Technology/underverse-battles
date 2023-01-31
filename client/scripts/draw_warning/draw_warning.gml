function draw_warning(side, scale) {
	var length = 5 * scale;
	switch (side) {
	case dir.up:
		var _warn = instance_create_depth(obj_battle_border.x - obj_battle_border.left, obj_battle_border.y - obj_battle_border.up + length, fight_depth.bullet_outside_hight, obj_warning);
		_warn.image_xscale = obj_battle_border.x / 5;
		_warn.image_yscale = scale;
		break;
	case dir.down:
		var _warn = instance_create_depth(obj_battle_border.x - obj_battle_border.left, obj_battle_border.y + obj_battle_border.down, fight_depth.bullet_outside_hight, obj_warning);
		_warn.image_xscale = obj_battle_border.x / 5;
		_warn.image_yscale = scale;
		break;
	case dir.left:
		var _warn = instance_create_depth(obj_battle_border.x - obj_battle_border.left, obj_battle_border.y + obj_battle_border.down, fight_depth.bullet_outside_hight, obj_warning);
		_warn.image_xscale = scale;
		_warn.image_yscale = obj_battle_border.y / 5;
		break;
	case dir.right:
		var _warn = instance_create_depth(obj_battle_border.x + obj_battle_border.right -  length, obj_battle_border.y + obj_battle_border.down, fight_depth.bullet_outside_hight, obj_warning);
		_warn.image_xscale = scale;
		_warn.image_yscale = obj_battle_border.y / 5;
		break;
	}
}