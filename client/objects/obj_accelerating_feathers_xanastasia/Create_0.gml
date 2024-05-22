event_inherited();
image_alpha = 0
depth = fight_depth.bullet_outside_hight;
damage = 6;
soul_invulnerability = 20;
accelerating_time = 0;
/* speed */
_speed = 2;

/* alpha */
alpha_step = 0.05;
image_angle = 0
audio_play_sound_plugging(snd_projectile);
time_source_fly = time_source_create(time_source_game,1/3,time_source_units_seconds,function(){

	time_source_start(time_source_rotate)
});
time_source_rotate = time_source_create(time_source_game,1/60,time_source_units_seconds,function(){
	accelerating_time ++
	image_angle = (sin(accelerating_time/30)*371)
	_speed = (sin(accelerating_time/30)*3)+2
},[],40);
time_source_start(time_source_fly)