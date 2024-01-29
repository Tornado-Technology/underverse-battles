function create_bone_row(side, object, step, offset, send_data = fight_network_mode) {
	if (send_data) send_battle_object_bone_row(side, object);
	
	var i = 0;
	var instances = [];
	var border = obj_battle_border;
	repeat(bone_count) {
		if (side == dir.up) {
			instances[i] = create_bone(border.x - border.left + i * step, border.y - border.up - offset, object,
				0, 0, 0, 180);
		}
		if (side == dir.down) {
			instances[i] = create_bone(border.x - border.left + i * step, border.y + border.down + offset, object,
				0, 0, 0, 0);
		}
		if (side == dir.left) {
			instances[i] = create_bone(border.x - border.left - offset, border.y - border.up + i * step, object,
				0, 0, 0, 270);
		}
		if (side == dir.right) {
			instances[i] = create_bone(border.x + border.right + offset, border.y - border.up + i * step, object,
				0, 0, 0, 90);
		}
		++i;
	}
	
	return instances;
}