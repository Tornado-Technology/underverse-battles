event_inherited();

damage = 0;
soul_invulnerability = 1;
destructible = false;
depth = fight_depth.bullet;

on_soul_touch = function(soul) {
	if (abs(soul.x - soul.xprevious) < 0.1 && abs(soul.y - soul.yprevious) < 0.1) return;
	fight_soul_damage(damage, destructible, id);
}
