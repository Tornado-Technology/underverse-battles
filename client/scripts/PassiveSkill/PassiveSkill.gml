/// @param {String} key
/// @return {Struct.PassiveSkillClass}
function PassiveSkill(key) {
	var passive_skill = new PassiveSkillClass(key + ".Name", key + ".Description");
	passive_skill.init();
	return passive_skill;
}

/// @param {String} key_name
/// @param {String} key_description
function PassiveSkillClass(key_name, key_description) constructor {
	self.key_name = key_name;
	self.key_description = key_description;
	
	name = "";
	description = "";
	
	static init = function() {
		name = translate_get(key_name);
		description = translate_get(key_description);
	}
}
