// Create border_instance
border_instance = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
if (battle_border_start_animation_end()) exit;

battle_border_set_color(false, false, c_purple);

// Create soul_instance
soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);

if (!created_scythe) {
	instance_create_depth(border_instance.x - border_instance.left - 20, border_instance.y - border_instance.up - 20, fight_depth.bullet_outside_hight, obj_scythe_jevil, {
		center_x: border_instance.x,
		center_y: border_instance.y
	});
	instance_create_depth(border_instance.x + border_instance.right + 20, border_instance.y - border_instance.up - 20, fight_depth.bullet_outside_hight, obj_scythe_jevil, {
		center_x: border_instance.x,
		center_y: border_instance.y
	});
	instance_create_depth(border_instance.x - border_instance.left - 20, border_instance.y + border_instance.down + 20, fight_depth.bullet_outside_hight, obj_scythe_jevil, {
		center_x: border_instance.x,
		center_y: border_instance.y
	});
	instance_create_depth(border_instance.x + border_instance.right + 20, border_instance.y + border_instance.down + 20, fight_depth.bullet_outside_hight, obj_scythe_jevil, {
		center_x: border_instance.x,
		center_y: border_instance.y
	});
	created_scythe = true;
}

// Create Δ delta Δ
//var dl = char_dani_delta; if (!instance_exists(dl)) delta = instance_create_depth(border_instance.x, border_instance.y, fight_depth.bullet_outside, dl);

if (time >= 480) instance_destroy();