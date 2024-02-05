event_inherited();

damage = 1;
soul_invulnerability = 1;
green_passive_skill(self);

can_move = true;

depth = fight_depth.bullet_outside_hight;
image_xskew = 0;
image_yskew = 0;
x_dir = 0;
y_dir = 0;

scale_speed = 4;

audio_play_sound_plugging(snd_string);

on_soul_touch = function(soul) {
	soul.speed_const = 1;
	soul.sprite_index = spr_battle_soul_glitched_by_green;
	time_source_start(soul.time_source_slowdown);
	fight_soul_damage(damage, destructible, id);
}