if (other.x == other.xprevious && other.y == other.yprevious) {
	var damage_source = self;
	fight_soul_damage(damage_source.damage, damage_source.destructible, damage_source);
}
