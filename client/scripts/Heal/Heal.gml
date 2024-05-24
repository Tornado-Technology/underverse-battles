function Heal(name, description, heal) : Item(name, description) constructor {
	self.name = name;
	self.description = description;
	self.heal = heal;
	
	type = ITEM_TYPE.HEAL;
}