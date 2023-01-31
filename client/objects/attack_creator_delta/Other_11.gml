// Create border
border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
if (battle_border_start_animation_end()) exit;

battle_border_set_color(false, false, c_purple);

// Create soul
soul = create_soul(border.x, border.y, battle_soul_type.red);

if (!created_scythe) {
	instance_create_depth(border.x - border.left - 20, border.y - border.up - 20, fight_depth.bullet_outside_hight, obj_scythe_jevil, {
		center_x: border.x,
		center_y: border.y
	});
	instance_create_depth(border.x + border.right + 20, border.y - border.up - 20, fight_depth.bullet_outside_hight, obj_scythe_jevil, {
		center_x: border.x,
		center_y: border.y
	});
	instance_create_depth(border.x - border.left - 20, border.y + border.down + 20, fight_depth.bullet_outside_hight, obj_scythe_jevil, {
		center_x: border.x,
		center_y: border.y
	});
	instance_create_depth(border.x + border.right + 20, border.y + border.down + 20, fight_depth.bullet_outside_hight, obj_scythe_jevil, {
		center_x: border.x,
		center_y: border.y
	});
	created_scythe = true;
}

// Create Δ delta Δ
//var dl = char_dani_delta; if (!instance_exists(dl)) delta = instance_create_depth(border.x, border.y, fight_depth.bullet_outside, dl);

if (time >= 480) instance_destroy();