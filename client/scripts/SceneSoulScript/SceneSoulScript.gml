function scene_soul_set_sprite(inst, spr){
	with (inst) {
		sprite_index = spr;
	}
	return true;
}

function scene_soul_animation(inst, val){
	with (inst) {
		animation_switch = val;
	}
	return true;
}

function scene_soul_collider(inst, val, _delay){
	with (inst) {
		collider_switch = val;
		collider_delay = _delay;
	}
	return true;
}