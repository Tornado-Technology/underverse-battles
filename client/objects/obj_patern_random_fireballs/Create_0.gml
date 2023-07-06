event_inherited();

raduis = battle_border.down + irandom_range(25, 50);
_angle = irandom_range(0, 360);
border_position = battle_border_get_position();

x = lengthdir_x(raduis, _angle) + border_position.px;
y = lengthdir_y(raduis, _angle) + border_position.py;

spawn_fireball = function() {
	var projectile = create_projectile(x, y, obj_projectile_fireball);
	projectile.target_position = Vector2(soul_instance.x, soul_instance.y);
}

time_source_spawn_fireball = time_source_create(time_source_game, 1, time_source_units_seconds, function() {
	spawn_fireball();
}, [], -1)

callback = function() {
	spawn_fireball();
	time_source_start(time_source_spawn_fireball);
}