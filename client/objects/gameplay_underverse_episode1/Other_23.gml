///@desc Выбор атаки Икс Чары

if (instance_exists(dlg)) {

	var soul_ = obj_scene_soul;
	if (dlg.cur_num == 3) {
		if (!instance_exists(soul_)) {
			var inst_soul_ = instance_create_depth(room_width - 320, room_height / 2, 0, soul_);
			scene_soul_set_sprite(inst_soul_, spr_battle_soul_red);
			scene_soul_animation(inst_soul_, false);
			scene_soul_collider(inst_soul_, true, 60);
		}
	}
	if (dlg.cur_num == 4) {
		if (instance_exists(soul_))
			instance_destroy(soul_);
	}
}

if (instance_exists(dlg))
	exit;
	
/* Fight */
fight_set_initiative(1);
				
/* Options */
fight_set_ui_showing_action_box(true);
fight_set_player_input(true);
fight_set_pause(true);

/* Next scenario */
scenario = 14;