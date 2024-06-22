enum ITEM_TYPE {
	UNDEFINED,
	HEAL,
	WEAPON,
	PROTECTION
}

function Item(key, cost = 0, special_function = function () {}) constructor {
	self.key = key;
	self.cost = cost;
	self.special_function = special_function;
	
	name = translate_get($"Item.{key}.Name");
	short_name = translate_get($"Item.{key}.ShortName");
	description = translate_get($"Item.{key}.Description");
	
	type = ITEM_TYPE.UNDEFINED;
	can_destroy_by_use = true;
	
	static set_can_destroy_by_use = function(value) {
		can_destroy_by_use = value;
		return self;
	}
}