event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
pattern_instance = create_pattern(obj_pattern_ink_blast, {
	max_acceleration: 18,
	gasterblaster_aiming: obj_gasterblaster_aiming_ink_sans
});