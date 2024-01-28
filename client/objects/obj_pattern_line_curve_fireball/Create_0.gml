// Arguments: fireball

raduis = battle_border.down + irandom_range(100, 100);
border_position = battle_border_get_position();

x = border_position.px - raduis;
y = border_position.py + irandom_range(-50, 50);

projectile = noone;
target_position = undefined;
projectile_position = undefined;

spawn_fireball = function() {
	event_user(0);
}

callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	spawn_fireball();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

var period = 50 - _power * 2;
var reteats = 5 + _power;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	spawn_fireball();
}, [], reteats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * reteats / 60, time_source_units_seconds, function() {
	instance_destroy();
});