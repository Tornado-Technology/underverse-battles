function Heal(key, hp, cost = 0, special_function = function() {}) : Item(key, cost) constructor {
	self.hp = hp;
	self.special_function = special_function;
	
	type = ITEM_TYPE.HEAL;
}