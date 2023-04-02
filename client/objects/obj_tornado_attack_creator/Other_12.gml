// Create border
if (border_instance == noone) {
	border_instance = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
}

if (battle_border_start_animation_end()) {
	exit;
}

if (soul_instance == noone) {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
}

if (time >= 480) {
	instance_destroy();
}
