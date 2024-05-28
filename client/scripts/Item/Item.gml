enum ITEM_TYPE {
	UNDEFINED,
	HEAL,
	WEAPON,
	PROTECTION
}

function Item(name, description, cost = 0, special_function = function () {}) constructor {
	self.name = name;
	self.description = description;
	self.cost = cost;
	self.special_function = special_function;
	
	type = ITEM_TYPE.UNDEFINED;
	can_destroy_by_use = true;
	
	static set_can_destroy_by_use = function(value) {
		can_destroy_by_use = value;
		return self;
	}
}