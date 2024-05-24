function Weapon(name, description, attack) : Item(name, description) constructor {
	self.name = name;
	self.description = description;
	self.attack = attack;
	
	type = ITEM_TYPE.WEAPON;
}