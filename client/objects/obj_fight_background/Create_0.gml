depth = fight_depth.bg;

if (global.fight_instance.story_mode) {
	background_id = global.fight_instance.background_id;
}
else {
	background_id = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.BACKGROUND_CUSTOM, 0);
}

background = background_get(background_info.sprite, background_id);
background_animator = background_get(background_info.animator, background_id);

if (background_animator != noone) {
	instance_create(background_animator);
}