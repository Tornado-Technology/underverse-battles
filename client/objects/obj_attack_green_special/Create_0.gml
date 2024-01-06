event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
pattern_instance = create_pattern_custom_power(obj_pattern_edit, 4, {
	bone: obj_bone_green,
	spike: obj_spear_green,
	knife_spin: obj_knife_spin_green,
	knife_directed: obj_knife_directed_xchara,
	gasterblaster_aiming: obj_gasterblaster_aiming_green,
	gasterblaster_aiming_solo: obj_turboblaster_aiming_green
});