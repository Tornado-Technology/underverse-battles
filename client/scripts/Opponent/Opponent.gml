function opponent_set_values(inst, id_, name_, char_name, char_skin, rating, type, badge){
	if (!instance_exists(inst) || inst == obj_opponent) return noone;
	inst.id_ = id_;
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

function opponent_get_name(id_){
	if (!instance_exists(obj_opponent)) return noone;
	if (obj_opponent.id_ == id_)
		return obj_opponent.name;
}

function opponent_get_type(id_){
	if (!instance_exists(obj_opponent)) return noone;
	if (obj_opponent.id_ == id_)
		return obj_opponent.type;
}

function opponent_get_character_name(id_){
	if (!instance_exists(obj_opponent)) return noone;
	if (obj_opponent.id_ == id_)
		return obj_opponent.character_name;
}

function opponent_get_character_skin(id_){
	if (!instance_exists(obj_opponent)) return noone;
	if (obj_opponent.id_ == id_)
		return obj_opponent.character_skin;
}

function opponent_get_rating(id_){
	if (!instance_exists(obj_opponent)) return noone;
	if (obj_opponent.id_ == id_)
		return obj_opponent.rating;
}

function opponent_destroy(id_){
	if (!instance_exists(obj_opponent)) return noone;
	if (obj_opponent.id_ == id_) {
		instance_destroy(obj_opponent);
		return true;
	}
}

function opponent_get_badge(id_){
	if (!instance_exists(obj_opponent)) return noone;
	if (obj_opponent.id_ == id_)
		return obj_opponent.badge;
}
