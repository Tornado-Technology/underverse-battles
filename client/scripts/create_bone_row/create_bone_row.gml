function create_bone_row(side, object, step, offset, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_battle_object_bone_row(side, object, step, offset);
	
	var i = 0;
	var instances = [];
	var border = obj_battle_border;
		if (side == dir.up) {
			while(border.x - border.left + i * step < border.right) {
				instances[i] = create_bone(border.x - border.left + i * step, border.y - border.up - offset, object,
					0, 0, 0, 180, storage_index);
				i++;
			}
		}
		if (side == dir.down) {
			while(border.x - border.left + i * step < border.right) {
				instances[i] = create_bone(border.x - border.left + i * step, border.y + border.down + offset, object,
					0, 0, 0, 0, storage_index);
				i++;
			}
		}
		if (side == dir.left) {
			while(border.y - border.up + i * step < border.down) {
				instances[i] = create_bone(border.x - border.left - offset, border.y - border.up + i * step, object,
					0, 0, 0, 270, storage_index);
				i++;
			}
		}
		if (side == dir.right) {
			while(border.x - border.left + i * step < border.down) {
				instances[i] = create_bone(border.x + border.right + offset, border.y - border.up + i * step, object,
					0, 0, 0, 90, storage_index);
				i++;
			}
		}
	
	return instances;
}