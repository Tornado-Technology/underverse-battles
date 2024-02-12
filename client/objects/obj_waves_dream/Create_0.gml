event_inherited();

damage = get_char_damage(obj_character_dream);
soul_invulnerability = 20;


depth = fight_depth.bullet_outside_hight;
image_alpha = 0;

stage = 0;

stop_alpha =  false;

_dir = direction;
var point = point_direction(x, y, obj_battle_soul.x, obj_battle_soul.y);
waver = part_type_create();
part_type_sprite(waver, sprite_index, true, true, false);

var part =  global.part_system_bullet_outside;
var int = part_emitter_create(global.part_system_bullet_outside);


part_particles_create(global.part_system_bullet_outside, x, y, waver, 1);
speed_const = 3;



time_source_destroy_waves = time_source_create(time_source_game, 23 / 60, time_source_units_seconds, function () {
	stop_alpha = true;
})