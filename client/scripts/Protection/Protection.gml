function Protection(key, defend, cost) : Item(key, cost) constructor {
	self.defend = defend;
	
	type = ITEM_TYPE.PROTECTION;
}