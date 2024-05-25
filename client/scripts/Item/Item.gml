enum ITEM_TYPE {
	UNDEFINED,
	HEAL,
	WEAPON,
	PROTECTION
}

function Item(name, description, cost = 0) constructor {
	self.name = name;
	self.description = description;
	self.cost = cost;
	
	type = ITEM_TYPE.UNDEFINED;
	can_destroy_by_use = true;
}