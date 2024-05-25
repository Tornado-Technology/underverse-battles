function Heal(name, description, hp, cost = 0) : Item(name, description, cost) constructor {
	self.name = name;
	self.description = description;
	self.hp = hp;
	self.cost = cost;
	
	type = ITEM_TYPE.HEAL;
}