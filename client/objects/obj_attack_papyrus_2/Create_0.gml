event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

switch(type) {
	default:
	create_border(battle_border.up + 10, battle_border.down, battle_border.left, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_bones_coming_out_of_walls_bone_spinning, {
			bone: obj_bone_shaking_papyrus
		});
	break;

};