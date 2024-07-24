event_inherited();

can_move = true;

damage = get_char_damage(obj_character_error_sans);

depth = fight_depth.bullet_outside_hight;
image_xskew = 0;
image_yskew = 0;
target_x = 0;
target_y = 0;

scale_speed = 4;

audio_play_sound_plugging(snd_string);
on_soul_touch = function (soul) {
	soul.speed_const = 1;
	time_source_start(soul.time_source_slowdown);
	fight_soul_damage(damage, destructible, id);
	
}