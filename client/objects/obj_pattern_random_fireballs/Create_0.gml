// Arguments: fireball

raduis = battle_border.down + irandom_range(25, 50);
_angle = irandom_range(0, 360);
border_position = battle_border_get_position();

x = lengthdir_x(raduis, _angle) + border_position.px;
y = lengthdir_y(raduis, _angle) + border_position.py;

callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	spawn_fireball();
	time_source_start(time_source_spawn_fireball);
}

spawn_fireball = function() {
	var projectile = instance_create_depth(x, y, fight_depth.bullet_outside, fireball);
	projectile.target_position = new Vector2(soul_instance.x, soul_instance.y);
}

var period = 60 - _power * 3;
var repeats = 5 + _power;
time_source_spawn_fireball = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	spawn_fireball();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function() {
	instance_destroy();
});