function Weapon(key, attack, cost = 0) : Item(key, cost) constructor {
	self.attack = attack;
	
	type = ITEM_TYPE.WEAPON;
}