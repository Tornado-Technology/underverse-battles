event_inherited();

on_soul_touch = function(soul) {
	soul.speed_const = 1;
	time_source_start(soul.time_source_slowdown);
	fight_soul_damage(damage, destructible, id);
}