for (var i = 0; i < 4; i++) {
	var heart = hearts[i];
	if (!instance_exists(heart)) continue;
	instance_destroy(heart);
}