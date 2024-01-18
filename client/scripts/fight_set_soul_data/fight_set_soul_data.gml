function fight_set_soul_data(playerId, px, py, angle, ability) {
	if (!instance_exists(obj_battle_soul_otherplayer)) return;
	var soul = obj_battle_soul_otherplayer;
	soul.next_x = px;
	soul.next_y = py;
	soul.image_angle = angle;
	soul.ability = ability;
}