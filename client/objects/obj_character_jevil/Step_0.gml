event_inherited();

if (teleport_attack) {
	sprite_index = teleport;
	image_index = lerp(image_index, 1, 0.1* dtime);
};

