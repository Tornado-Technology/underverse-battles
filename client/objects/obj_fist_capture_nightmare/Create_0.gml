event_inherited();

release_sprite = spr_fist_unclenching_nightmare;
hand_sprite = spr_hand_nightmare;
grab_sprite = spr_fist_capture_nightmare;
fist_sprite = spr_fist_nightmare;

_angle = 20;

soul_invulnerability = 20;
damage = get_char_damage(obj_character_nightmare);

index_sprite = 0;
outside_force_speed = 0;

capture = false;

move_beginning = true;

destroy = false;
step = 0.5;

on_soul_touch = function(soul) {
	if (capture) exit;
	
	capture = true;
	time_source_start(time_source_capture);
	audio_play_sound_plugging(snd_grab);
	sprite_index = grab_sprite;
}

time_source_capture = time_source_create(time_source_game, 20 / 60, time_source_units_seconds, function () {
	destroy = true;
});