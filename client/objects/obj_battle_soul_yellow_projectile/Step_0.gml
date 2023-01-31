/// @desc Movement & Collision
x += cos(degtorad(image_angle)) * movoment_speed;
y -= sin(degtorad(image_angle)) * movoment_speed;

if (place_meeting(x, y, obj_battle_element)) {
	var instance = instance_place(x, y, obj_battle_element);
	instance_destroy(instance);
	instance_destroy();
}

if (x > room_width || x < 0 || y > room_height || y < 0) {
	instance_destroy();
}
