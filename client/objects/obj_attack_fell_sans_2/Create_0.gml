event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
pattern_instance = create_pattern(obj_pattern_blue_attack_four_bones, {
	bone: obj_bone_fell_sans,
	use_gravity_attack: use_gravity_attack
});