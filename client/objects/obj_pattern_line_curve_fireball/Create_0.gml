event_inherited();

raduis = battle_border.down + irandom_range(100, 100);
border_position = battle_border_get_position();

x = border_position.px - raduis;
y = border_position.py + irandom_range(-50, 50);

projectile = noone
target_position = undefined;
projectile_position = undefined;

spawn_fireball = function() {
	event_user(0)
}

callback = function() {
	spawn_fireball();
}