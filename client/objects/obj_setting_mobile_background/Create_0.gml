depth = fight_depth.bg;

sprite = noone;
background_animator = noone;

var bg_id = _background.deltarune_battle;
background = background_get(background_info.sprite, bg_id);
background_obj = background_get(background_info.animator, bg_id);

if (background_obj != noone) background_animator = instance_create(background_obj);

if (background != noone || background != -1) { 
	sprite = background;
}
