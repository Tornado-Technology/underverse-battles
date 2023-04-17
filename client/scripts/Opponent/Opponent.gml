function opponent_set_values(inst, _id, name_, char_name, char_skin, rating, type, badge){
	if (!instance_exists(inst) || inst == obj_opponent) return noone;
	inst._id = _id;
	inst.name = name_;
	inst.character_name = char_name;
	inst.character_skin = char_skin;
	inst.rating = rating;
	inst.type = type;
	inst.badge = badge;
	return 0;
}

function opponent_set_name(inst, name_){
	if (!instance_exists(inst) || inst == obj_opponent) return noone;
	inst.name = name_;
	return 0;
}

function opponent_set_character_name(inst, char_name){
	if (!instance_exists(inst) || inst == obj_opponent) return noone;
	inst.character_name = char_name;
	return 0;
}

function opponent_set_character_skin(inst, char_skin){
	if (!instance_exists(inst) || inst == obj_opponent) return noone;
	inst.character_skin = char_skin;
	return 0;
}

function opponent_set_rating(inst, rating){
	if (!instance_exists(inst) || inst == obj_opponent) return noone;
	inst.rating = rating;
	return 0;
}

function opponent_get_name(_id){
	if (!instance_exists(obj_opponent)) return noone;
	if (obj_opponent._id == _id)
		return obj_opponent.name;
}

function opponent_get_type(_id){
	if (!instance_exists(obj_opponent)) return noone;
	if (obj_opponent._id == _id)
		return obj_opponent.type;
}

function opponent_get_character_name(_id){
	if (!instance_exists(obj_opponent)) return noone;
	if (obj_opponent._id == _id)
		return obj_opponent.character_name;
}

function opponent_get_character_skin(_id){
	if (!instance_exists(obj_opponent)) return noone;
	if (obj_opponent._id == _id)
		return obj_opponent.character_skin;
}

function opponent_get_rating(_id){
	if (!instance_exists(obj_opponent)) return noone;
	if (obj_opponent._id == _id)
		return obj_opponent.rating;
}

function opponent_destroy(_id){
	if (!instance_exists(obj_opponent)) return noone;
	if (obj_opponent._id == _id) {
		instance_destroy(obj_opponent);
		return true;
	}
}

function opponent_get_badge(_id){
	if (!instance_exists(obj_opponent)) return noone;
	if (obj_opponent._id == _id)
		return obj_opponent.badge;
}
