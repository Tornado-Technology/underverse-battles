event_inherited();

damage = 0;
soul_invulnerability = 1;
destructible = false;
depth = fight_depth.bullet;

on_soul_touch = function(soul) {
	fight_soul_damage(damage, destructible, id);
}
