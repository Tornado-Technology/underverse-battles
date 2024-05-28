function Heal(name, description, hp, cost = 0, special_function = function() {}) : Item(name, description, cost) constructor {
	self.name = name;
	self.description = description;
	self.hp = hp;
	self.cost = cost;
	self.special_function = special_function;
	
	type = ITEM_TYPE.HEAL;
}