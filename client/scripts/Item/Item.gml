enum ITEM_TYPE {
	UNDEFINED,
	HEAL,
	WEAPON,
	PROTECTION
}

function Item(name, description) constructor {
	self.name = name;
	self.description = description;
	
	type = ITEM_TYPE.UNDEFINED;
}