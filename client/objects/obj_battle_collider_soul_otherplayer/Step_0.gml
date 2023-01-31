if (is_collided) {
	cooldown = cooldown_max;
	is_collided = false;
}

if (cooldown > 0) cooldown--;