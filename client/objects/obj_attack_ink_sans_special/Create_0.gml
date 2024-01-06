event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
pattern_instance = create_pattern_custom_power(obj_pattern_ink_blast, 0, {
	max_acceleration: 18,
	gasterblaster_aiming: obj_gasterblaster_aiming_ink_sans
});