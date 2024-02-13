event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

type = irandom_range(0, 0);
switch (type) {
	case 0 :
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bone_and_spikes_from_sides, {
			bone: obj_bone_nightmare,
			spike: obj_spike_pushing_nightmare
		});
	break;
};
