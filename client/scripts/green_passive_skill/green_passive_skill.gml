function green_passive_skill(bullet) {
	bullet.damage = 1;
	bullet.soul_invulnerability = 1;
	if (irandom_range(0, 1) == 1) {
		bullet.damage = 5;
		bullet.soul_invulnerability = 20;
	}
}