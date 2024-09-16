function Heal(key, hp, cost = 0, special_function = function() {}) : Item(key, cost, special_function) constructor {
	self.hp = hp;
	self.special_function = special_function;
	
	type = ITEM_TYPE.HEAL;
}