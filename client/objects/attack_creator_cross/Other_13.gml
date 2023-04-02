/// @description Crusader
if (started) exit;

_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
if (battle_border_start_animation_end()) exit;

side_random = choose(dir.up, dir.down, dir.left, dir.right);

var soul_position = Vector2(_border.x, _border.y - _border.up + 15);
if (side_random == dir.down) {
	soul_position = Vector2(_border.x, _border.y + _border.down - 15);
}
if (side_random == dir.left) {
	soul_position = Vector2(_border.x - _border.left + 15, _border.y);
}
if (side_random == dir.right) {
	soul_position = Vector2(_border.x + _border.right - 15, _border.y);
}
_soul = create_soul(soul_position.x, soul_position.y, battle_soul_type.red);

var bone_scale = 9.5;
var bone_dir = point_direction(_border.x - _border.left - 10, _border.y - _border.up - 10, _border.x + _border.right + 10, _border.y + _border.down + 10);
var bone = create_bone(_border.x - _border.left - 10, _border.y - _border.up - 10, bone_obj, 0, 1, bone_dir, bone_dir - 90);
bone.scale_const = bone_scale;
bone.scale_time = 0.1;
bone_dir = point_direction(_border.x + _border.right + 10, _border.y - _border.up - 10, _border.x - _border.left - 10, _border.y + _border.down + 10);
bone = create_bone(_border.x + _border.right + 10, _border.y - _border.up - 10, bone_obj, 0, 1, bone_dir, bone_dir - 90);
bone.scale_const = bone_scale;
bone.scale_time = 0.1;
audio_play_sound_once(snd_spare_up);

time_source_start(time_source_update_3_0);
time_source_start(time_source_update_destroy_3_0);

started = true;