/// @desc Physics
velocity_x = approach(velocity_x, 0, 0.03);
velocity_y = approach(velocity_y, gravity_y, 0.05);

x += velocity_x;
y += velocity_y;

image_angle = velocity_x * 50;

if (bbox_bottom >= floor_y && !small) {
	instance_destroy();
	audio_play_sound(snd_projectile, 1, false);
	repeat(3) {
		instance_create_depth(x, y, 0, obj_drop_tea_delta, {
			small: true,
			velocity_y: irandom_range(-1, -2),
			velocity_x: irandom_range(-1, 1),
			image_xscale: 0.7,
			image_yscale: 0.7,
			floor_y: floor_y
		});
	}
}

if (y > room_height + sprite_height) {
	instance_destroy();
}
