function create_bone_row(side, object, step, offset) {
	var i = 0;
	var instances = [];
	var border = obj_battle_border;
		if (side == dir.up) {
			while(border.x - border.left + i * step < border.right) {
				instances[i] = create_bone(border.x - border.left + i * step, border.y - border.up - offset, object,
					0, 0, 0, 180);
				i++;
			}
		}
		if (side == dir.down) {
			while(border.x - border.left + i * step < border.right) {
				instances[i] = create_bone(border.x - border.left + i * step, border.y + border.down + offset, object,
					0, 0, 0, 0);
				i++;
			}
		}
		if (side == dir.left) {
			while(border.y - border.up + i * step < border.down) {
				instances[i] = create_bone(border.x - border.left - offset, border.y - border.up + i * step, object,
					0, 0, 0, 270);
				i++;
			}
		}
		if (side == dir.right) {
			while(border.x - border.left + i * step < border.down) {
				instances[i] = create_bone(border.x + border.right + offset, border.y - border.up + i * step, object,
					0, 0, 0, 90);
				i++;
			}
		}
	
	return instances;
}