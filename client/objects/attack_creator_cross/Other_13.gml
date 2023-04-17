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

var bone_scale = 9.4;
_bones[0] = create_bone(_border.x, _border.y, bone_spin_obj, 0, 0, 45, -45);
_bones[0].change_scale(bone_scale, 0.1);
_bones[1] = create_bone(_border.x, _border.y, bone_spin_obj, 0, 0, 135, 45);
_bones[1].change_scale(bone_scale, 0.1);
audio_play_sound_once(snd_spare_up);

time_source_start(time_source_update_3_0);

started = true;