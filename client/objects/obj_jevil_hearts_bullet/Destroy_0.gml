var i = 0;
repeat(4) {
	var heart = hearts[i];
	if (!instance_exists(heart)) continue;
	instance_destroy(heart);	
	i++;
}