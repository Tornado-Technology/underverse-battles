function Protection(name, description, defend) : Item(name, description) constructor {
	self.name = name;
	self.description = description;
	self.defend = defend;
	
	type = ITEM_TYPE.PROTECTION;
}