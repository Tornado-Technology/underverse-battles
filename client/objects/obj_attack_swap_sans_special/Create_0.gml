event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
pattern_instance = create_pattern_custom_power(obj_pattern_full_length_bones_ultimate, 4, {
	bone: obj_bone_swap_sans,
	sharp_bone: obj_bone_sharp_swap_sans
});