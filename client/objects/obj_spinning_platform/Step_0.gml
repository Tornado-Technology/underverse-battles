if (can_move_spinning) {
	if (image_angle <= 360) {
		if (place_meeting(x, y, obj_battle_soul)) {
			fight_soul_damage(damage, destructible, id);
		};

		image_angle += 10;
	}
	else {
		can_move_spinning = false;
		image_angle = 0;
	};
};

if (place_meeting(x, y, obj_fist_nightmare)) {

	can_move_spinning = true;
};