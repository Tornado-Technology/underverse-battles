// I so lasy make it hands
depth = fight_depth.soul;

// Actions
follow_board = false;
moveable = true;
ability = false;

// Network stuff
is_otherplayer_soul = false;
skip_frame = 0;

// Invincibility
invincibility = 0;
invincibility_update = function() {
	image_blend = c_white;
	if (invincibility > 0) {
		invincibility = approach(invincibility, 0, 1);
		
		var color_index = wave(1, -1, 1, 0); 
		if (color_index > 0) {
			image_blend = make_color_rgb(90, 90, 90);
		}
	}
}

// Create collider soul
collider_soul = instance_create_depth(x, y, depth, obj_battle_collider_soul);
